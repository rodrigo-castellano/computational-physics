

int potencia(cComplejo a,unsigned int n)
{
    int i;
    double prod;
    prod=1.0;
    for(i=0;i<n;i++)
    prod=prod*a;
    return prod;
}
