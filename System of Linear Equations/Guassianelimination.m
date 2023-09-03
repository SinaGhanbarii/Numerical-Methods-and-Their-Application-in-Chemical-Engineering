
A=[0 1 -1;-2 4 -1;-2 5 -4]; %This is a sample. you can change the matrice
b=[3;1;-2]; %This is a sample. you can change the matrice
C=[A b];

n=length(b);
x=zeros(n,1);

for i=1:n-1
    if A(i,i)==0
        [m, k]=max(abs(A(i+1:end,i)));
        A(i,:)=A(i,:)+A(i+k,:);
        b(i)=b(i)+b(i+k);
    end
end

for k=1:n-1
   for i=k+1:n
      s=A(i,k)/A(k,k);
      for j=k+1:n
         A(i,j)=A(i,j)-s*A(k,j);
      end
      b(i)=b(i)-s*b(k);
   end
end

x(n)=b(n)/A(n,n);
for i=n-1:-1:1
   r=0;
   for j=i+1:n
      r=r+A(i,j)*x(j);
      x(i)=(b(i)-r)/A(i,i);
   end 
end
for i=1:n
   for j=1:n
      if (j<i) A(i,j)=0; end
   end
end
disp('The answer is: '), disp(x)