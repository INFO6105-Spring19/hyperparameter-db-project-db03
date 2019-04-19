USE hp_03;
-- To find the best (hyperparameter name) amongst all the models of GBM algorithm along with its value

-- use case 1 Gbm algorithm
SELECT  models.model_name, mod_metrics.rmse, gbm_hpara.* FROM 
models INNER JOIN mod_metrics ON 
models.id = mod_metrics.model_id
INNER JOIN gbm_hpara ON
models.id = gbm_hpara.model_id
WHERE 
mod_metrics.run_time = 300 AND mod_metrics.algo_id = 'Algo_gbm'
ORDER BY mod_metrics.rmse;
------------------------------------------------------------------------------------
-- Use case 2nd algorithm drf algorithm
SELECT  models.model_name, mod_metrics.rmse, drf_hpara.* FROM 
models INNER JOIN mod_metrics ON 
models.id = mod_metrics.model_id
INNER JOIN drf_hpara ON
models.id = drf_hpara.model_id
WHERE 
mod_metrics.run_time = 300 AND mod_metrics.algo_id = 'Algo_drf'
ORDER BY mod_metrics.rmse;
------------------------------------------------------------------------------------
-- use case 3rd algorithm glm algorithm
SELECT  models.model_name, mod_metrics.rmse, glm_hpara.* FROM 
models INNER JOIN mod_metrics ON 
models.id = mod_metrics.model_id
INNER JOIN glm_hpara ON
models.id = glm_hpara.model_id
WHERE 
mod_metrics.run_time = 300 AND mod_metrics.algo_id = 'Algo_glm'
ORDER BY mod_metrics.rmse;
------------------------------------------------------------------------------------
-- use case 4 naive_bayes algorithm
SELECT  models.model_name, mod_metrics.rmse, naive_bayes_hpara.* FROM 
models INNER JOIN mod_metrics ON 
models.id = mod_metrics.model_id
INNER JOIN naive_bayes_hpara ON
models.id = naive_bayes_hpara.model_id
WHERE 
mod_metrics.run_time = 300 AND mod_metrics.algo_id = 'Algo_naive_bayes'
ORDER BY mod_metrics.rmse;
------------------------------------------------------------------------------------
-- use case 5tl algorithm
SELECT  models.model_name, mod_metrics.rmse, xg_boost_hpara.* FROM 
models INNER JOIN mod_metrics ON 
models.id = mod_metrics.model_id
INNER JOIN xg_boost_hpara ON
models.id = xg_boost_hpara.model_id
WHERE 
mod_metrics.run_time = 300 AND mod_metrics.algo_id = 'Algo_xgboost'
ORDER BY mod_metrics.rmse;
------------------------------------------------------------------------------------
-- **************************************************************************
-- To count the number of models formed for each algorithm for each runtime
-- use case 6 for 300 secs
SELECT algo_h2o.algo_name, COUNT(mod_metrics.algo_id) AS no_of_models
FROM
mod_metrics INNER JOIN algo_h2o ON 
mod_metrics.algo_id = algo_h2o.algo_id
WHERE mod_metrics.run_time = 300
GROUP BY algo_h2o.algo_id;
----------------------------------------------------------------------------------
-- use case 7 for 500 secs
SELECT algo_h2o.algo_name, COUNT(mod_metrics.algo_id) AS no_of_models
FROM
mod_metrics INNER JOIN algo_h2o ON 
mod_metrics.algo_id = algo_h2o.algo_id
WHERE mod_metrics.run_time = 500
GROUP BY algo_h2o.algo_id;
----------------------------------------------------------------------------------------

-- use case 8 for 700 secs
SELECT algo_h2o.algo_name, COUNT(mod_metrics.algo_id) AS no_of_models
FROM
mod_metrics INNER JOIN algo_h2o ON 
mod_metrics.algo_id = algo_h2o.algo_id
WHERE mod_metrics.run_time = 700
GROUP BY algo_h2o.algo_id;

-- ************************************************************************************************************8
-- After seeing the variable importance of hyperparameters we are interested in values
--  of these partiular hyperparameters
SELECT mod_metrics.algo_id, models.model_name, 
mod_metrics.rmse, glm_hpara.seed, glm_hpara.lambda  FROM 
models INNER JOIN mod_metrics ON 
models.id = mod_metrics.model_id
INNER JOIN glm_hpara ON
models.id = glm_hpara.model_id
WHERE 
mod_metrics.run_time = 300 AND mod_metrics.algo_id = 'Algo_gbm'
ORDER BY mod_metrics.rmse;

-- ************************************************************************************************************
-- After seeing the importance of hyperparameters we are interested in values of these partiular hyperparameters
SELECT mod_metrics.algo_id, models.model_id AS model_name, mod_metrics.rmse, glm_hpara.seed, glm_hpara.lambda  FROM 
models INNER JOIN mod_metrics ON 
models.id = mod_metrics.model_id
INNER JOIN glm_hpara ON
models.id = glm_hpara.model_id
WHERE 
mod_metrics.run_time = 300 AND mod_metrics.algo_id = 'Algo_gbm'
ORDER BY mod_metrics.rmse;


-- 1.To find the best model amongst all the models of GBM algorithm along with its value
-- 2.To find the best model amongst all the models of GLM algorithm along with its value
-- 3.To find the best model amongst all the models of Naive Bayes algorithm along with its value
-- 4.To find the best model amongst all the models of DRF along with its value
-- 5.To find the best model amongst all the models of Xgboost algorithm along with its value
-- 6.To count the number of models formed for each algorithm for runtime 300s
-- 7.To count the number of models formed for each algorithm for runtime 500s
-- 8.To count the number of models formed for each algorithm for runtime 1000s
-- 9. What should be the maximum depth allowed for my decision tree?
-- 10. What should be the minimum number of samples required at a leaf node in my Xgboost?
-- 11. How many trees should I include in my XGboost?
-- 12. What should I set my learning rate to for GBM?