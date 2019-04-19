USE hp_03_2;
-- To find the best (hyperparameter name) amongst all the models of GBM algorithm along with its value
SELECT  models.model_id AS model_name, mod_metrics.rmse, gbm_hpara.* FROM 
models INNER JOIN mod_metrics ON 
models.id = mod_metrics.model_id
INNER JOIN gbm_hpara ON
models.id = gbm_hpara.model_id
WHERE 
mod_metrics.run_time = 300 AND mod_metrics.algo_id = 'Algo_gbm'
ORDER BY mod_metrics.rmse;

-- ************************************************************************************************************8
-- To count the number of models formed for each algorithm for each runtime
SELECT algo_h20.algo_name, COUNT(mod_metrics.algo_id) AS no_of_models
FROM
mod_metrics INNER JOIN algo_h20 ON 
mod_metrics.algo_id = algo_h20.algo_id
WHERE mod_metrics.run_time = 300
GROUP BY algo_h20.algo_id; 
-- ************************************************************************************************************8
-- After seeing the importance of hyperparameters we are interested in values of these partiular hyperparameters
SELECT mod_metrics.algo_id, models.model_id AS model_name, mod_metrics.rmse, glm_hpara.seed, glm_hpara.lambda  FROM 
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