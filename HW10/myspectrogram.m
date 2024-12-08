function X = myspecgram(x,N,w,M)
    x = x(:); % make sure it's a column
    w = w(:); % make sure it's a column
    for i = 1 : floor((length(x)-(N-1))/M)
        X(:,i) = abs(fft(x((1:N)+(i-1)*M).*w)).^2;
    end
end