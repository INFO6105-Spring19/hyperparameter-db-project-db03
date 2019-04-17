CREATE DATABASE IF NOT EXISTS hp_03_2;
USE hp_03_2;

CREATE TABLE dataset
(
	id VARCHAR(10),
    dataset_name VARCHAR(100),
    dataset_type VARCHAR(100),
    tot_col INT,
    tot_row INT,
 PRIMARY KEY(id)
);
-- ******************************************************************************************8
CREATE TABLE IF NOT EXISTS data_des
(
	id VARCHAR(10),
	dataset_id VARCHAR(10),
	col_name VARCHAR(100),
    col_type VARCHAR(100),
    tot_row INT,
    info_type ENUM("1", "0"),
    PRIMARY KEY(id),
    FOREIGN KEY(dataset_id) REFERENCES dataset(id)
    );
-- ******************************************************************************************8

CREATE TABLE IF NOT EXISTS models
(	id VARCHAR(10),
	dataset_id VARCHAR(10),
	model_id VARCHAR(255),
	PRIMARY KEY(id),
    FOREIGN KEY(dataset_id) REFERENCES dataset(id)
);
-- ******************************************************************************************8
CREATE TABLE IF NOT EXISTS model_meta
(
	id VARCHAR(10),
    model_id VARCHAR(255),
    sys_date DATE,
    run_time INT,
    PRIMARY KEY(id),
    FOREIGN KEY(model_id) REFERENCES models(id)
);
-- ******************************************************************************************8

CREATE TABLE IF NOT EXISTS algo_h20
(
	algo_id VARCHAR(10),
    algo_name VARCHAR(100),
    PRIMARY KEY (algo_id)
);
-- ******************************************************************************************8
DROP TABLE h_parameter;
CREATE TABLE IF NOT EXISTS h_parameter
(
	id VARCHAR(10),
    model_id VARCHAR(255),
    algo_id VARCHAR(100),
    run_time INT,
    PRIMARY KEY(id),
    FOREIGN KEY(model_id) REFERENCES models(id),
    FOREIGN KEY(algo_id) REFERENCES algo_h20(algo_id)
);
-- ******************************************************************************************8
CREATE TABLE IF NOT EXISTS drf_hpara
(
	id VARCHAR(10),
    model_id VARCHAR(255),
    algo_id VARCHAR(100),
    run_time INT,
    mtries FLOAT,
    categorical_encoding FLOAT,
    PRIMARY KEY(id),
    FOREIGN KEY(model_id) REFERENCES models(id),
    FOREIGN KEY(algo_id) REFERENCES algo_h20(algo_id)
);
-- ******************************************************************************************8
CREATE TABLE IF NOT EXISTS glm_hpara
(
	id VARCHAR(10),
    model_id VARCHAR(255),
    algo_id VARCHAR(100),
    run_time INT,
    seed FLOAT,
    tweedie_variance_power FLOAT,
    alpha FLOAT,
    lambda FLOAT,
    missing_values_handling FLOAT,
    standardize FLOAT,
    theta FLOAT,
    PRIMARY KEY(id),
    FOREIGN KEY(model_id) REFERENCES models(id),
    FOREIGN KEY(algo_id) REFERENCES algo_h20(algo_id)
);
-- ******************************************************************************************8
CREATE TABLE IF NOT EXISTS gbm_hpara
(
	id VARCHAR(10),
    model_id VARCHAR(255),
    algo_id VARCHAR(100),
    run_time INT,
    learn_rate FLOAT,
    learn_rate_annealing FLOAT,
    col_sample_rate FLOAT,
    max_abs_leafnode_pred FLOAT,
    pred_noise_bandwidth FLOAT,
    distribution FLOAT,
    tweedie_power FLOAT,
    quantile_alpha FLOAT,
    huber_alpha FLOAT,
    categorical_encoding FLOAT,
    PRIMARY KEY(id),
    FOREIGN KEY(model_id) REFERENCES models(id),
    FOREIGN KEY(algo_id) REFERENCES algo_h20(algo_id)
);
-- ******************************************************************************************8
CREATE TABLE IF NOT EXISTS naive_bayes_hpara
(
	id VARCHAR(10),
    model_id VARCHAR(255),
    algo_id VARCHAR(100),
    run_time INT,
    laplace FLOAT,
    min_sdev FLOAT,
    eps_sdev FLOAT,
    min_prob FLOAT,
    eps_prob FLOAT,
    compute_metrics FLOAT,
    seed FLOAT ,
    PRIMARY KEY(id),
    FOREIGN KEY(model_id) REFERENCES models(id),
    FOREIGN KEY(algo_id) REFERENCES algo_h20(algo_id)
);
-- ******************************************************************************************8
CREATE TABLE IF NOT EXISTS xg_boost_hpara
(
	id VARCHAR(10),
    model_id VARCHAR(255),
    algo_id VARCHAR(100),
    ntrees INT,
    max_depth INT,
    min_row INT, 
    seed FLOAT,
    sample_rate FLOAT,
    sub_sample FLOAT,
    col_sample_rate FLOAT,
    col_sample_by_level FLOAT,
    col_sample_rate_per_tree FLOAT,
    colsample_bytree FLOAT,
    min_split_improvement FLOAT,
    gamma FLOAT,
    learn_rate FLOAT,
    eta FLOAT,
    max_abs_leafnode_pred FLOAT,
    max_delta_step FLOAT,
    distribution FLOAT,
    tweedie_power FLOAT,
    categorical_encoding FLOAT,
    tree_method FLOAT,
    num_leaves FLOAT,
    min_sum_hessian_in_leaf FLOAT,
    min_data_in_leaf FLOAT,
    grow_policy FLOAT,
    booster FLOAT,
    reg_lambda FLOAT,
    sample_type FLOAT, 
    normalize_type FLOAT,
    rate_drop FLOAT, 
    one_drop FLOAT,
    skip_drop FLOAT,
	PRIMARY KEY(id),
    FOREIGN KEY(model_id) REFERENCES models(id),
    FOREIGN KEY(algo_id) REFERENCES algo_h20(algo_id)
);
-- ******************************************************************************************8
CREATE TABLE IF NOT EXISTS mod_metrics
(
	id VARCHAR(10),
    algo_id VARCHAR(100),
    run_time VARCHAR(100),
    model_id VARCHAR(255),
    mse FLOAT,
    rmse FLOAT,
    mae FLOAT,
    rmsle FLOAT,
    mean_residue_deviance FLOAT,
    PRIMARY KEY(id),
    FOREIGN KEY(model_id) REFERENCES models(id),
    FOREIGN KEY(algo_id) REFERENCES algo_h20(algo_id)
);

-- ******************************************************************************************8