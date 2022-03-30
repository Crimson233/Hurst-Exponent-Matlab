% Calculate Hurst Exponent using Aggregated Variance Method
% 聚合方差法计算Hurst指数
% ------Input------
% Signal: 1D time series
% ------Output------
% hur: hurst exponent
% hur <= 0.5: the time series is noise
% hur > 0.5： the time series is long-term memory (there's a trend in the time series)
function hur = Hurst(Signal)
    N = length(Signal);
    cnt = 0;
    Var = 0;
    m = 2;
    M = m;
    while m <= N/2
        k = N/m;
        if(floor(k) ~= k)
            m = m+1;
            continue;
        end
        Mean = zeros(k,1);
        for i = 1:k
            Mean(i,1) = mean(Signal((i-1)*m+1:i*m,1));
        end
        cnt = cnt+1;
        Var(cnt) = var(Mean);
        M(cnt) = m;
        m = m+1;
    end
    A=[log(M.'),ones(length(M),1)];
    At = A.';
    hX = (At*A)^(-1)*At*(log(Var.'));
    hur = hX(1) / 2 + 1;
end