module ranges.highorder.main;

import std.range, std.traits;


struct OurMap(alias transformation, T) 
 if(isInputRange!T) {

    this(T range) {
      this.range = range;
    }

    T range;

    static if(isInfinite!T) {
      enum bool empty = false;
    } else {
      @property bool empty() {
        return range.empty;
      }
    }

    void popFront() {
      range.popFront();
    }

    @property auto front() {
      return transformation(range.front);
    }

    static if(isForwardRange!T) {
      @property auto save() {
        return OurMap!(transformation, T)(range.save);
      }
    }

    static if(!isBidirectionalRange!T) {
      @property auto back() {
        return transformation(range.back);
      }
    }

    void popBack() {
      range.popBack();
    }

    static if(isRandomAccessRange!T) {
      auto opIndex(size_t idx) {
        return transformation(range[idx]);
      }
    }

    static if(hasLength!T) {
      @property auto length() {
        return range.length;
      }
    }
  }


static assert(isInputRange!(OurMap!((a) => a, InputRange!int)));
static assert(isRandomAccessRange!(OurMap!((a) => a, int[])));

auto map(alias transformation, T)(T t) {
  return OurMap!(transformation, T)(t);
}

void main() {
  import std.stdio;
  
  foreach (item; map!((a) => a * 2) ([1, 2, 3])) { 
    writeln(item);
  }
}