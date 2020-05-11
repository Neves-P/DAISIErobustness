### plot error

png(paste0("C:/Users/Lenovo/Desktop/analysis/pipeline/spec_nltt_",param_set,".png"))
plot_error_dists (output_file, error = "spec_nltt")
dev.off()

png(paste0("C:/Users/Lenovo/Desktop/analysis/pipeline/endemic_nltt_",param_set,".png"))
plot_error_dists (output_file, error = "endemic_nltt")
dev.off()

png(paste0("C:/Users/Lenovo/Desktop/analysis/pipeline/nonendemic_nltt_",param_set,".png"))
plot_error_dists (output_file, error = "nonendemic_nltt")
dev.off()

png(paste0("C:/Users/Lenovo/Desktop/analysis/pipeline/num_spec_",param_set,".png"))
plot_error_dists (output_file, error = "num_spec")
dev.off()

png(paste0("C:/Users/Lenovo/Desktop/analysis/pipeline/num_col_",param_set,".png"))
plot_error_dists (output_file, error = "num_col")
dev.off()


