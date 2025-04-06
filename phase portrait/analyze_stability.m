function analyze_stability(J_at_eq, eq_point)
    fprintf('\n평형점 (%f, %f)에서의 분석:\n', double(eq_point(1)), double(eq_point(2)));
    fprintf('야코비안 행렬:\n');
    disp(double(J_at_eq));
    
    fprintf('고유값:\n');
    eig_vals = eig(double(J_at_eq));
    disp(eig_vals);
    
    % 안정성 분석
    real_parts = real(eig_vals);
    imag_parts = imag(eig_vals);
    
    % Exponentially Stable
    if all(real_parts < 0)
        fprintf('안정성: Exponentially Stable\n');
        fprintf('모든 고유값의 실수부가 음수입니다.\n');
        fprintf('시스템이 지수적으로 수렴합니다.\n');
    % Asymptotically Stable
    elseif all(real_parts <= 0) && ...
           (all(real_parts < 0) || (any(real_parts == 0) && all(imag_parts(real_parts == 0) == 0)))
        fprintf('안정성: Asymptotically Stable\n');
        fprintf('모든 고유값의 실수부가 0 이하이고, 실수부가 0인 고유값이 단순근입니다.\n');
        fprintf('시스템이 점근적으로 수렴합니다.\n');
    % Marginally Stable
    elseif all(real_parts <= 0)
        fprintf('안정성: Marginally Stable\n');
        fprintf('모든 고유값의 실수부가 0 이하이고, 실수부가 0인 고유값이 중복근입니다.\n');
        fprintf('시스템이 진동하거나 일정한 진폭을 유지합니다.\n');
    % Unstable
    else
        fprintf('안정성: Unstable\n');
        fprintf('적어도 하나의 고유값의 실수부가 양수입니다.\n');
        fprintf('시스템이 발산합니다.\n');
    end
    
    % 고유값 특성 분석
    if all(imag_parts == 0)
        fprintf('고유값이 모두 실수입니다.\n');
    else
        fprintf('복소수 고유값이 존재합니다.\n');
        fprintf('복소수 고유값의 쌍: ');
        for j = 1:length(eig_vals)
            if imag_parts(j) ~= 0
                fprintf('%.4f ± %.4fi ', real_parts(j), abs(imag_parts(j)));
            end
        end
        fprintf('\n');
    end
end 