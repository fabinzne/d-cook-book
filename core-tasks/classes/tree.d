module classes.tree;

interface Expression {
  public int evaluate();
}

mixin template BinaryExpression() {
  private int leftExpression;
  private int rightExpression;

  this(int left, int right) {
    this.leftExpression = left;
    this.rightExpression = right;
  }
}

class AddExpression : Expression {
  mixin BinaryExpression;

  public int evaluate() {
    return this.leftExpression + this.rightExpression;
  }
}

class SubstractExpression : Expression {
  mixin BinaryExpression;

  public int evaluate() {
    return this.leftExpression - this.rightExpression;
  }
}

class BokenAddExpression : AddExpression {
  this(int left, int right) { 
    super(left, right); 
  }

  override public int evaluate() {
    return this.leftExpression - this.rightExpression;
  }
}

void printResult(Expression expr) {
  import std.stdio;
  writeln(expr.evaluate());
}

void main(){
  auto add = new AddExpression(1, 2);
  printResult(add);

  auto subtract = new SubstractExpression(2, 1);
  printResult(subtract);  

  add = new BokenAddExpression(1, 2);
  printResult(add);
}