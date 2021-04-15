f <- function(){
  cat("Hello, world!\n")
}
f()

#separando o banco de dados para responder se o tamanho apresentado é menor ou maior que a média da variável.

f <- function(nro) {
  if(nro < median(iris$Sepal.Length)) {
    for(i in 0:nro) {
      cat("Pequena")
    }
  } else {
    cat("Grande")
  }
}

f(0.5)

#Criando uma função que identifica o efeito da função round (aredondar) no banco de dados.

difround <- function(x) {
  x <- x - round(x)
  return(x)
}

difround(iris$Sepal.Width)