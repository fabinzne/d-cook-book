module phobos.json.main;

void main() {
  import std.json: toJSON, JSONValue, parseJSON;
  import std.algorithm, std.stdio;

  auto list = parseJSON(`[
    {
      "name": "Alice", "id": 1
    }, 
    {
      "name": "Bob", "id": 2
    }
  ]`);

  foreach (person; list.array.map!(a => a.object)) {
    writeln("ID #", person["id"].integer, " is ", person["name"].str);
  }

  JSONValue newPerson;

  JSONValue[string] obj;

  obj["name"] = "Charlie";
  obj["id"] = 3;

  newPerson.object = obj;

  list.array = list.array ~ newPerson;

  writeln(toJSON(list));
}