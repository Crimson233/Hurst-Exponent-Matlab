# Hurst-Exponent-Matlab
Calculate hurst exponent using aggregated variance method （聚合方差法计算Hurst指数）  
------Input------  
Signal: 1D time series  
------Output------  
hur: hurst exponent  
hur <= 0.5: the time series is noise  
hur > 0.5： the time series is long-term memory (there's a trend in the time series)  
