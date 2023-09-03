%LU Decomposition Method for Solving the System of Linear Equations

A=[1 7 -4;4 -4 9;12 -1 3]; %This is a sample. you can change the matrice
b=[-51;62;8];            %This is a sample. you can change the matrice
C=[A b];                 %This is a sample. you can change the matrice

n=length(b);
x=zeros(n,1);
d=zeros(n,1);

for i=1:n-1
    if A(i,i)==0
        [m,k]=max(abs(A(i+1:end,i)));
        A(i,:)=A(i,:)+A(i+k,:);
        b(i)=b(i)+b(i+k);
    end
end

L(1,1)=A(1,1);
for i=1:n
   U(i,i)=1;
end

for j=2:n
   L(j,1)=A(j,1);
   U(1,j)=A(1,j)/A(1,1);
end

for i=2:n-1
   S=0;
   for k=1:i-1
      S=S+U(k,i)*L(i,k);
   end   
   L(i,i)=(A(i,i)-S)/U(i,i);  
   for j=i+1:n
      S=0;
      for k=1:i-1
         S=S+U(k,i)*L(j,k);
      end
      L(j,i)=(A(j,i)-S)/U(i,i);
      S=0;
      for k=1:i-1
         S=S+U(k,j)*L(i,k);
      end
      U(i,j)=(A(i,j)-S)/L(i,i);
   end
end

%the last row and column

S=0;
for k=1:n-1
   S=S+U(k,n)*L(n,k);
end
L(n,n)=(A(n,n)-S)/U(n,n);

d(1)=b(1)/L(1,1);
for i=2:n
   t=0;
   for k=1:i-1
      t=t+L(i,k)*d(k);  
   end
   d(i)=(b(i)-t)/L(i,i);
end

%U{x}=b

x(n)=d(n);
for j=n-1:-1:1
    r=0;
    for k=j+1:n
        r=r+U(j,k)*x(k);
    end
    x(j)=d(j)-r;
end   
disp('L Matrice: '), disp(L)
disp('U Matrice: '), disp(U)
disp('The answer is: '), disp(x)
