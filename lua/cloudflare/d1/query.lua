--[[--------------------------------------------
            Cloudflare - D1 Query
--------------------------------------------]]--

local tb, tn = tobool, tonumber

-- Query Meta Methods
local QUERY_META = {}

function QUERY_META:HasChanged()    return tb(self.changed_db) end
function QUERY_META:GetChanges()    return tn(self.changes) end
function QUERY_META:GetDuration()   return tn(self.duration) end
function QUERY_META:GetLastRowID()  return tn(self.last_row_id) end
function QUERY_META:GetRowsRead()   return tn(self.rows_read) end
function QUERY_META:GetRowsWritten() return tn(self.rows_written) end
function QUERY_META:GetSizeAfter()  return tn(self.size_after) end

-- Alias
QUERY_META.GetLastRow = QUERY_META.GetLastRowID
QUERY_META.SizeChanged = QUERY_META.GetSizeAfter

QUERY_META.__index = QUERY_META


-- Query Methods
local QUERY_RESPONSE = {}

function QUERY_RESPONSE:HasSuccess() return tb(self.success) end
function QUERY_RESPONSE:GetFirstResult()
    return self.result[1]
end

function QUERY_RESPONSE:GetMeta()
    return setmetatable(self:GetFirstResult(), QUERY_META)
end