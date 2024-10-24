-- Variables
local D1Module = Cloudflare:Module("D1")
local DBConnection = D1Module:DefaultConnection()

-- Database
D1Module:CreateDatabase("example", {
    ["name"] = "TEXT",
    ["age"] = "INTEGER",
    ["money"] = "INTEGER"
})


D1Module:GetDatabase("example"):Connect(function(connection)
    DBConnection = connection
end)


-- Methods
DBConnection:RawQuery("SELECT * FROM example", function(results)
    PrintTable(results)
end)

DBConnection:TableExists("example", function(exists)
    print(exists)
end)

DBConnection:Insert("table_name", {
    ["name"] = "John Doe",
    ["age"] = 25,
    ["money"] = 1000
})

DBConnection:Update("table_name", "name = 'John Doe'", {
    ["age"] = 26
})

DBConnection:Delete("table_name", "name = 'John Doe'")

DBConnection:Get("table_name", "name = 'John Doe'", function(results, err)
    if err then
        error(err)
    end

    PrintTable(results)
end)

DBConnection:GetValue("table_name", "name = 'John Doe'", "age", function(result, err)
    if err then
        error(err)
    end

    print(result)
end)