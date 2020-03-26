context("ml_constraints")

test_that("test ml_constraints works", {

  passed_constraints_list <- list(
    data.frame(1, 2, 3, 4, 5, 6),
    data.frame(1, 2, 3, 4, 5, 6)
  )
  failed_constraints_list <- list(
    "A string",
    data.frame(1, 2, 3, 4, 5, 6)
  )

  passed_constraint <- DAISIErobustness:::ml_constraints(
    passed_constraints_list
  )
  failed_constraint <- DAISIErobustness:::ml_constraints(
    failed_constraints_list
  )

  expect_false(failed_constraint)
  expect_true(passed_constraint)
})

test_that("test ml_constraints works with long list", {

a_list <- list("1", "2")
for (i in 3:100) {
  a_list[[i]] <- c(1, 2, 3)
}
DAISIErobustness:::ml_constraints(a_list)

})
