A=[0 4 -1;3 4 2;11 10 15];
b=[-1;-5;-20];
n=length(A);
x=zeros(n,1);
for i=1:n-1
    if A(i,i)==0
        [m, k]=max(abs(A(i+1:end,i)));
        A(i,:)=A(i,:)+A(i+k,:);
        b(i)=b(i)+b(i+k);
    end
end
M=[A,b];

for j=1:n-1
    for i=j+1:n
        M(i,:)=M(i,:)-M(j,:)*(M(i,j)/M(j,j));
    end
end

for j=1:n-1
    for i=j+1:n
        M(i,:)=M(i,:)-M(j,:)*(M(i,j)/M(j,j));
    end
end

for j=n:-1:2 
    for  i=j-1:-1:1
        M(i,:)=M(i,:)-M(j,:)*(M(i,j)/M(j,j));
    end
end

for i=1:n
    M(i,:)=M(i,:)/M(i,i);
    x(i)=M(i,n+1);
end
disp('The answer is: '), disp(x)