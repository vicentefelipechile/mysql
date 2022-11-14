local function isnumber(n) return type(n) == "number" end
local function istable(t) return type(t) == "table" end
local function isstring(s) return type(s) == "string" end

function table.GetKeys( tbl )

    local keys = {}
    local id = 1

    for k, _ in ipairs( tbl ) do
        keys[ id ] = k
        id = id + 1
    end

    return keys

end

function table.HasValue( tbl, val )
    for k, v in pairs( tbl ) do
        if ( v == val ) then return true end
    end
    return false
end

function PrintTable( tbl, indent )
	local keys = table.GetKeys( tbl )

    local done = done or {}
    local indent = indent or 0

	table.sort( keys, function( a, b )
		if ( isnumber( a ) and isnumber( b ) ) then return a < b end
		return tostring( a ) < tostring( b )
	end )

    done[ tbl ] = true

	for i = 1, #keys do
		local key = keys[ i ]
		local value = tbl[ key ]
		print( string.rep( "\t", indent ) )

		if  ( istable( value ) and not done[ value ] ) then

			done[ value ] = true
			print( key .. ":\n" )
			PrintTable ( value, indent + 2, done )
			done[ value ] = nil

		else

			print( key .. "\t=\t" .. value .. "\n" )

		end

	end

end

function string.StartsWith( s, pos )
    return string.sub( s, 1, string.len( pos ) ) == pos
end

function string.EndsWith( s, pos )
    return pos == "" or string.sub( s, -string.len( pos ) ) == pos
end

 function FTU(s)
    return (s:gsub("^%l", string.upper))
end

htmlLua = {}

function htmlLua.Title(s, class)
    return class and "    <h1 class=\"" .. class .. "\">" .. s .. "</h1>\n" or "    <h1>" .. s .. "</h1>\n"
end

function htmlLua.subTitle(s, class)
    return class and "    <h2 class=\"" .. class .. "\">\n        " .. s .. "\n    </h2>\n" or "    <h2>\n        " .. s .. "\n    </h2>\n"
end