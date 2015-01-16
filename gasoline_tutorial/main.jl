
using GLM, DataFrames, NumericExtensions, Distributions



data = readtable("gasoline.csv",header = false)



OLS = glm(x6~x2+x3+x4,data,Normal(),IdentityLink())

vcov(OLS)


