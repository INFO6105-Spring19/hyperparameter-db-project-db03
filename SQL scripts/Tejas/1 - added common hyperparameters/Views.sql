use hp_03;
--------------------------------------------------------------------------
CREATE VIEW `gbm_algorithm`as 
SELECT  models.model_name, mod_metrics.rmse, gbm_hpara.* FROM 
models INNER JOIN mod_metrics ON 
models.id = mod_metrics.model_id
INNER JOIN gbm_hpara ON
models.id = gbm_hpara.model_id
WHERE 
mod_metrics.algo_id = '1'
ORDER BY mod_metrics.rmse;
--------------------------------------------------------------------------
Drop view glm_algorithm;
CREATE VIEW `glm_algorithm`as 
SELECT  models.model_name, mod_metrics.rmse, glm_hpara.* FROM 
models INNER JOIN mod_metrics ON 
models.id = mod_metrics.model_id
INNER JOIN glm_hpara ON
models.id = glm_hpara.model_id
WHERE 
mod_metrics.algo_id = '2'
ORDER BY mod_metrics.rmse;
--------------------------------------------------------------------------
CREATE VIEW `drf_algorithm`as 
SELECT  models.model_name, mod_metrics.rmse, drf_hpara.* FROM 
models INNER JOIN mod_metrics ON 
models.id = mod_metrics.model_id
INNER JOIN drf_hpara ON
models.id = drf_hpara.model_id
WHERE 
mod_metrics.algo_id = '3'
ORDER BY mod_metrics.rmse;
--------------------------------------------------------------------------
CREATE VIEW `naive_bayes_algorithm`as 
SELECT  models.model_name, mod_metrics.rmse, naive_bayes_hpara.* FROM 
models INNER JOIN mod_metrics ON 
models.id = mod_metrics.model_id
INNER JOIN naive_bayes_hpara ON
models.id = naive_bayes_hpara.model_id
WHERE 
mod_metrics.algo_id = '4'
ORDER BY mod_metrics.rmse;
--------------------------------------------------------------------------
CREATE VIEW `xg_boost_algorithm`as 
SELECT  models.model_name, mod_metrics.rmse, xg_boost_hpara.* FROM 
models INNER JOIN mod_metrics ON 
models.id = mod_metrics.model_id
INNER JOIN xg_boost_hpara ON
models.id = xg_boost_hpara.model_id
WHERE 
mod_metrics.algo_id = '5'
ORDER BY mod_metrics.rmse;






