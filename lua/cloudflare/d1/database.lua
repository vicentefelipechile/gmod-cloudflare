--[[--------------------------------------------
            Cloudflare - D1 Database
--------------------------------------------]]--

local DATABASE = {}

function DATABASE:GetCreation()     return self.created_at end
function DATABASE:GetName()         return self.name end
function DATABASE:GetSize()         return tonumber(self.file_size) end
function DATABASE:GetTablesAmount() return tonumber(self.num_tables) end
function DATABASE:GetUUID()         return self.uuid end
function DATABASE:GetVersion()      return self.version end
function DATABASE:IsProduction()    return self.production end
function DATABASE:IsSuccess()       return tobool(self.success) end

-- On Error
function DATABASE:GetErrors()
    if self:IsSuccess() then return end

    return self.errors
end

function DATABASE:GetFirstError()
    if self:IsSuccess() then return end

    return self.errors[1]
end

function DATABASE:GetMessageError()
    if self:IsSuccess() then return end

    return self:GetFirstError().message
end