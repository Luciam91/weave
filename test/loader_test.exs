defmodule Test.Weave.Loader do
  use ExUnit.Case

  test "It can merge Lists" do
    current_config = ["database.com", "6666"]

    assert ["username", "password", "database.com", "6666"] = Test.Weave.Loaders.Test.test_merge(current_config, ["username", "password"])
  end

  test "It can merge Keyword Lists" do
    current_config = [host: "www.database.com"]

    assert [host: "www.database.com", port: 6666] = Test.Weave.Loaders.Test.test_merge(current_config, [port: 6666])
  end

  test "It can merge Maps" do
    current_config = %{host: "www.database.com"}

    assert %{host: "www.database.com", port: 6666} = Test.Weave.Loaders.Test.test_merge(current_config, %{port: 6666})
  end

  test "It can merge binaries" do
    current_config = "www.database.com"

    assert "new.database.com" = Test.Weave.Loaders.Test.test_merge(current_config, "new.database.com")
  end
end
