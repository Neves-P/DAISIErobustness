context("is_novel_sim_outputs")

test_that("use", {
  novel_sim <- list()
  # Nested list that replicates novel_sim() output
  novel_sim[[1]] <-
    list(
      list(
        list(
          "island_age" = 1,
          "not_present" = 1,
          "stt_all" = c(1, 0)
        )
      )
    )
  novel_sim_no_age <- novel_sim
  novel_sim_no_not_present <- novel_sim
  novel_sim_no_stt_all <- novel_sim
  novel_sim_no_age[[1]][[1]][[1]][["island_age"]] <- NULL
  novel_sim_no_not_present[[1]][[1]][[1]][["not_present"]] <- NULL
  novel_sim_no_stt_all[[1]][[1]][[1]][["stt_all"]] <- NULL
  expect_true(is_novel_sim_outputs(novel_sim = novel_sim))
  expect_false(is_novel_sim_outputs(novel_sim = novel_sim_no_age))
  expect_false(is_novel_sim_outputs(novel_sim = novel_sim_no_not_present))
  expect_false(is_novel_sim_outputs(novel_sim = novel_sim_no_stt_all))
})
