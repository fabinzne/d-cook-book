module user.defined.vector;

struct Vector {
  float magnitude;
  float direction;

  static Vector fromPoint(float[2] point) {
    import std.math;
    Vector v;
    float x = point[0];
    float y = point[1];

    v.magnitude = sqrt(x ^^ 2 + y ^^ 2);
    v.direction = atan2(y, x);

    return v;
  }

  float[2] toPoint() const {
    import std.math;
    float x = cos(direction) * magnitude;
    float y = sin(direction) * magnitude;

    return [x, y];
  }

  Vector opBinary(string op : "+")(Vector rhs) const {
    auto point = toPoint(), point2 = rhs.toPoint();
    point[0] += point2[0];
    point[1] += point2[1];

    return Vector.fromPoint(point);
  }
}

void main() {
  auto origin = Vector(0, 0);
  import std.math;

  auto result = origin + Vector(1, PI);
  import std.stdio;
  writeln("Vector result: ", result);
  writeln(" Point result: ", result.toPoint());
}