#include <cctype>
#include <iostream>
#include <gtest/gtest.h>

enum class tokenType{
  OPSUMA, //+
  OPRESTA, //-
  OPMULT, //*
  PAR_ABIERTO, //(
  PAR_CERRADO, //)
  NUMERO, //num 13 26 30
};


class Token{
  public:
  Token(tokenType tipo, std::string attr):tipo(tipo), attr(attr){

  }

  tokenType getTipo() {
    return tipo;
  }
  std::string getAtributo() {
    return attr;
  }

private:
  tokenType tipo;
  std::string attr;
};

class Lexer{
  public:
  Lexer(std::string input):current_idx(0), input(input){

  }

  Token getNextToken() {
    while(input[current_idx]==' '){
      current_idx++;
    }

    switch(input[current_idx]){
      case '+':
        current_idx++;
        return Token(tokenType::OPSUMA, "+");
      case '-':
        current_idx++;
        return Token(tokenType::OPRESTA, "-");
      case '*':
        current_idx++;
        return Token(tokenType::OPMULT, "*");
      case '(':
        current_idx++;
        return Token(tokenType::PAR_ABIERTO, "(");
      case ')':
        current_idx++;
        return Token(tokenType::PAR_CERRADO, ")");
      default:
        {
          std::size_t begin_idx=current_idx;
          while(isdigit(input[current_idx])){
            current_idx++;
          }

          //ERROR if(begin_idx==current_idx) //error
          return Token(tokenType::NUMERO, input.substr(begin_idx, current_idx - begin_idx));
        }
    }
  }

  private:
    std::size_t current_idx;
    std::string input;
};


template<typename T>
class Parser{
  public:
  Parser(Lexer lex):lex(lex){

  }

  bool opsuma(){
    Token target=lex.getNextToken();
    //IF NOT opsuma
    return target.getTipo()==tokenType::OPSUMA;
  }

  T term(){
    factor();
    while(1){
      opmult();
      factor();
      if(){
        break;
      }
    }
  }

  T factor(){
    switch(){
      case //(:
        exp();
        //);
      case num:
        //noop
      default:
        //error;
        //Encontrado el lexema ) pero se esperaba ( o numero en la línea #.
    }
  }

  T exp(){
    T op1 = term();
    T res=op1;
    while(1){
      opsuma();
      T op2 = term();
      res+=op2;
      if(){
        break;
      }
    }
    return res;
  }

  T evaluate(){return 0;};
  tree_t parse(){return nullptr;};

  private:
    Lexer lex;
};

TEST(LexerTest, BasicAssert){
  std::string input="256";
  Lexer lex(input);
  Token testToken=lex.getNextToken();
  EXPECT_EQ(testToken.getTipo(), tokenType::NUMERO);
  EXPECT_EQ(testToken.getAtributo(), "256");
}

TEST(LexerTest, BasicAssertSpaces){
  std::string input=" 256 ";
  Lexer lex(input);

  Token testToken=lex.getNextToken();
  EXPECT_EQ(testToken.getTipo(), tokenType::NUMERO);
  EXPECT_EQ(testToken.getAtributo(), "256");
}

TEST(LexerTest, BasicMultiAssert){
  std::string input="   256+   ) 0 )";
  Lexer lex(input);

  Token testToken=lex.getNextToken();
  EXPECT_EQ(testToken.getAtributo(), "256");
  EXPECT_EQ(testToken.getTipo(), tokenType::NUMERO);
  testToken=lex.getNextToken();
  EXPECT_EQ(testToken.getAtributo(), "+");
  EXPECT_EQ(testToken.getTipo(), tokenType::OPSUMA);
  testToken=lex.getNextToken();
  EXPECT_EQ(testToken.getAtributo(), ")");
  EXPECT_EQ(testToken.getTipo(), tokenType::PAR_CERRADO);
  testToken=lex.getNextToken();
  EXPECT_EQ(testToken.getAtributo(), "0");
  EXPECT_EQ(testToken.getTipo(), tokenType::NUMERO);
  testToken=lex.getNextToken();
  EXPECT_EQ(testToken.getAtributo(), ")");
  EXPECT_EQ(testToken.getTipo(), tokenType::PAR_CERRADO);
}

TEST(ParserTest, BasicASsertion){
  std::string input=" ( 100 ) + (30-10) * 5 ";
  Lexer lex(input);
  Parser<int> parser(lex);
  int resultado = parser.evaluate();
  EXPECT_EQ(resultado, 200);
}

// struct HelloFixture: ::testing::TestWithParam<std::size_t> {};

// TEST_P(HelloFixture, BasicAssertion) {
//   int N=GetParam();
//   int cont=0;

//   for(int I=0;I<N;I++)
// 	  cont++;
 
//   EXPECT_EQ(cont, GetParam());
// }

// INSTANTIATE_TEST_CASE_P(
//         HelloTest,
//         HelloFixture,
//         ::testing::Values( 100, 200, 300, 500, 10000, 1000005));

