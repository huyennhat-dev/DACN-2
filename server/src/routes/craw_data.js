const router = require("express").Router();
const cheerio = require("cheerio");
const axios = require("axios");
const slug = require("slug");

const { categoriesModel } = require("../models/categories");
const { random } = require("lodash");
const { productModel } = require("../models/product");
const { adminModel } = require("../models/admin");

router.post("/", async (req, res) => {
  const { url, categories } = req.body;

  const cateSlug = slug(categories);

  let category;

  category = await categoriesModel.findOne({ slug: cateSlug });

  if (!category) {
    category = await categoriesModel.create({
      name: categories,
      slug: cateSlug,
      status: "645d30d2eb6f40e2906325fa",
    });
  }

  try {
    const response = await axios.get(url);
    const $ = cheerio.load(response.data);
    const data = [];

    const itemUrls = [];

    $(
      "#main .category-page-row .col.large-12 .shop-container .products .product .box-image .image-fade_in_back a"
    ).each((index, el) => {
      const itemUrl = $(el).attr("href");
      itemUrls.push(itemUrl);
    });

    let completedRequests = 1;
    console.log(itemUrls);

    for (let i = 1; i <= itemUrls.length; i++) {
      const res = await axios.get(itemUrls[i]);
      const $$ = cheerio.load(res.data);

      const name = $$(".product-container .product-info h1.product-title")
        .text()
        .trim();

      const photo = $$(
        ".product-container .product-gallery .woocommerce-product-gallery img"
      ).attr("src");

      const price = parseInt(
        $$(".product-container .product-info .product-page-price bdi")
          .first()
          .text()
          .trim()
          .replace(/\D/g, "") || 10000,
        10
      );

      const sale = (Math.random() * 0.15).toFixed(2);
      const purchases = random(10,100)

      const sortDesc = $$(
        ".product-container .product-info .product-short-description"
      )
        .html()
        .trim();

      const desc = $$(
        ".product-container .product-page-accordian .accordion-inner"
      )
        .html()
        .trim();

      const quantity = random(10, 100);
      const categories = category._id;
      const status = "645d30d2eb6f40e2906325fa";
      const extraPerson = "645fd0b6b9c84aa81c7d5a02";

      const product = await productModel.create({
        name,
        photos: [photo],
        author: sortDesc,
        price,
        quantity,
        sale,
        purchases,
        description: desc,
        categories,
        status,
        extraPerson,
      });

      await categoriesModel.updateOne(
        { _id: category._id },
        { $push: { products: product._id } }
      );
      await adminModel.updateOne(
        { _id: extraPerson },
        { $push: { products: product._id } }
      );

      console.log("Crawl success: " + completedRequests);

      if (completedRequests == 20) {
        return res.json("success");
      }
      completedRequests++;
    }
  } catch (error) {
    console.log(error);
  }
});

router.put("/update", async (req, res) => {
  await productModel.updateMany(
    { sale: 0 },
    {
      $set: {
        sale: 0.0,
      },
    }
  );
  return res.json("ok");
});

module.exports = router;
