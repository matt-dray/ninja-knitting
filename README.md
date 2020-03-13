# ninja-knitting

[![Blog post](https://img.shields.io/badge/rostrum.blog-post-008900?labelColor=000000&logo=data%3Aimage%2Fgif%3Bbase64%2CR0lGODlhEAAQAPEAAAAAABWCBAAAAAAAACH5BAlkAAIAIf8LTkVUU0NBUEUyLjADAQAAACwAAAAAEAAQAAAC55QkISIiEoQQQgghRBBCiCAIgiAIgiAIQiAIgSAIgiAIQiAIgRAEQiAQBAQCgUAQEAQEgYAgIAgIBAKBQBAQCAKBQEAgCAgEAoFAIAgEBAKBIBAQCAQCgUAgEAgCgUBAICAgICAgIBAgEBAgEBAgEBAgECAgICAgECAQIBAQIBAgECAgICAgICAgECAQECAQICAgICAgICAgEBAgEBAgEBAgICAgICAgECAQIBAQIBAgECAgICAgIBAgECAQECAQIBAgICAgIBAgIBAgEBAgECAgECAgICAgICAgECAgECAgQIAAAQIKAAAh%2BQQJZAACACwAAAAAEAAQAAAC55QkIiESIoQQQgghhAhCBCEIgiAIgiAIQiAIgSAIgiAIQiAIgRAEQiAQBAQCgUAQEAQEgYAgIAgIBAKBQBAQCAKBQEAgCAgEAoFAIAgEBAKBIBAQCAQCgUAgEAgCgUBAICAgICAgIBAgEBAgEBAgEBAgECAgICAgECAQIBAQIBAgECAgICAgICAgECAQECAQICAgICAgICAgEBAgEBAgEBAgICAgICAgECAQIBAQIBAgECAgICAgIBAgECAQECAQIBAgICAgIBAgIBAgEBAgECAgECAgICAgICAgECAgECAgQIAAAQIKAAA7)](https://www.rostrum.blog/2020/03/12/knit-with-params/)

## What

You want to use R to generate multiple reports from a single template, each containing different data.

How? Create a parameterised RMarkdown template with a params YAML argument. Iterate over param values with rmarkdown::render() inside purrr::map().

This repo contains a demo of the approach that focuses on parameterised {xaringan} slides. It includes a further {purrr} step with pagedown::chrome_print() to render the HTML outputs to PDF.

## Contents

`docs/` contains:

* a parameterised RMarkdown report template (`ninja-knitting-template.Rmd`)
* resources (`libs/` and `styles/`)
* rendered HTMLs (one for each parameter passed to the template)
* rendered PDFs (one for each HTML)

`src` contains one R file, `00-run.R`, that:

1. Iterates over the RMarkdown template with different param variables to produce HTML reports
1. Iterates over the HTML reports to render them to PDF

Read more on [the associated blog post](https://www.rostrum.blog/2020/03/12/knit-with-params/).