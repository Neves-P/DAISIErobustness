if (requireNamespace("lintr", quietly = TRUE)) {
  skip_if(Sys.getenv("CI") == "")
  test_that("Package Style", {
    lintr::expect_lint_free()
  })
}
