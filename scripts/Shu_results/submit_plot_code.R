### operation on cluster
chmod go-rwx .ssh
cat id_rsa.pub >> authorized_keys
chmod go-w authorized_keys

remotes::install_github("Neves-P/DAISIErobustness@trait")
remotes::install_github("rsetienne/DAISIE@shu_traits")

submit_robustness(
  param_space_name = "trait",
  account = "p286026",
  replicates = 100,
  num_job = c(201, 570),
  partition = "gelifes",
  folder = "/data"
)



sim = output_file$geodynamic_sim
replicates = 100
stt_rows <- c()
n_spec <- c()
n_col <- c()
for (i in seq_len(replicates)) {
  stt_rows[i] <- nrow(sim[[i]][[1]][[1]]$stt_all)
  n_spec[i] <-
    as.numeric(sim[[i]][[1]][[1]]$stt_all[stt_rows[i], "nI"]) +
    as.numeric(sim[[i]][[1]][[1]]$stt_all[stt_rows[i], "nA"]) +
    as.numeric(sim[[i]][[1]][[1]]$stt_all[stt_rows[i], "nC"])
  n_col[i] <-
    as.numeric(sim[[i]][[1]][[1]]$stt_all[stt_rows[i], "present"])
}
prop_rep_over_15_spec <- length(which(n_spec >= 15))
prop_rep_over_5_cols <- length(which(n_col >= 5))
prop_rep_less_100_spec <- length(which(n_spec <= 100))
prop_rep_over_15_spec
prop_rep_over_5_cols
prop_rep_less_100_spec







