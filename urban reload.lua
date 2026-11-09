-- Urban Reload | .gg/Kc9Ecy7uyR
-- FINAL + WALLPAPER — one file, paste only this

local ok, Rayfield = pcall(function()
    return loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
end)
if not ok or not Rayfield then warn("[UR] rayfield failed") return end

local Window = Rayfield:CreateWindow({
    Name = "Urban Reload | .gg/Kc9Ecy7uyR",
    LoadingTitle = "Urban Reload",
    LoadingSubtitle = ".gg/Kc9Ecy7uyR",
    ConfigurationSaving = {Enabled=true, FolderName="urban_reload", FileName="cfg"},
    KeySystem = false,
    Theme = {
        TextColor = Color3.fromRGB(255,255,255),
        Background = Color3.fromRGB(12,12,18),
        Topbar = Color3.fromRGB(18,18,26),
        Shadow = Color3.fromRGB(0,0,0),
        NotificationBackground = Color3.fromRGB(12,12,18),
        NotificationActionsBackground = Color3.fromRGB(22,22,32),
        TabBackground = Color3.fromRGB(18,18,26),
        TabStroke = Color3.fromRGB(55,55,75),
        TabBackgroundSelected = Color3.fromRGB(28,28,42),
        TabTextColor = Color3.fromRGB(170,170,170),
        SelectedTabTextColor = Color3.fromRGB(255,85,255),
        ElementBackground = Color3.fromRGB(20,20,28),
        ElementBackgroundHover = Color3.fromRGB(26,26,36),
        SecondaryElementBackground = Color3.fromRGB(16,16,22),
        ElementStroke = Color3.fromRGB(48,48,68),
        SecondaryElementStroke = Color3.fromRGB(42,42,62),
        SliderBackground = Color3.fromRGB(0,0,8),
        SliderProgress = Color3.fromRGB(255,85,255),
        SliderStroke = Color3.fromRGB(80,40,120),
        ToggleBackground = Color3.fromRGB(22,22,32),
        ToggleEnabled = Color3.fromRGB(255,85,255),
        ToggleDisabled = Color3.fromRGB(55,55,55),
        ToggleEnabledStroke = Color3.fromRGB(200,60,200),
        ToggleDisabledStroke = Color3.fromRGB(75,75,75),
        ToggleEnabledOuterStroke = Color3.fromRGB(150,40,150),
        ToggleDisabledOuterStroke = Color3.fromRGB(55,55,55),
        DropdownSelected = Color3.fromRGB(255,85,255),
        DropdownUnselected = Color3.fromRGB(140,140,140),
        InputBackground = Color3.fromRGB(16,16,22),
        InputStroke = Color3.fromRGB(48,48,68),
        PlaceholderColor = Color3.fromRGB(110,110,110),
    }
})

-- WALLPAPER INJECTION
task.spawn(function()
    task.wait(1.5)
    local WP = "https://cdn.discordapp.com/attachments/1535765340653621330/1569239287021445280/IMG_9855.jpg?ex=6af2bb79&is=6af169f9&hm=3d7f7953d639836f0437b295f362d104ea0c5c2a590e64bd3c743b972450691e&"
    local coreGui = game:GetService("CoreGui")
    for _, gui in ipairs(coreGui:GetDescendants()) do
        if gui:IsA("Frame") and gui.Name == "Main" then
            local par = gui:FindFirstAncestorOfClass("ScreenGui")
            if par and par.Name:find("Rayfield") then
                local wp = Instance.new("ImageLabel")
                wp.Name="UR_WP";wp.Size=UDim2.new(1,0,1,0)
                wp.BackgroundTransparency=1;wp.ImageTransparency=0.82
                wp.ScaleType=Enum.ScaleType.Crop;wp.ZIndex=0
                wp.Image=WP;wp.Parent=gui
                local ov = Instance.new("Frame")
                ov.Name="UR_OV";ov.Size=UDim2.new(1,0,1,0)
                ov.BackgroundColor3=Color3.fromRGB(8,8,14)
                ov.BackgroundTransparency=0.45;ov.ZIndex=1
                ov.BorderSizePixel=0;ov.Parent=gui
                local cr = gui:FindFirstChildOfClass("UICorner")
                if cr then
                    Instance.new("UICorner",wp).CornerRadius=cr.CornerRadius
                    Instance.new("UICorner",ov).CornerRadius=cr.CornerRadius
                end
                break
            end
        end
    end
end)

local Players=game:GetService("Players")
local RS=game:GetService("RunService")
local UIS=game:GetService("UserInputService")
local Lighting=game:GetService("Lighting")
local LP=Players.LocalPlayer
local Camera=workspace.CurrentCamera
local cg=game:GetService("CoreGui")

local S={
    Speed=false,SpeedVal=3,Jump=false,JumpVal=120,
    Noclip=false,InfJump=false,Fly=false,FlySpeed=60,
    Chams=false,ESPName=false,ESPHealth=false,ESPDist=false,
    ESPBox=false,ESPHead=false,ESPTracer=false,
    ESPArrow=false,ESPArrowSize=20,ESPArrowRadius=0.3,
    TeamCheck=true,ESPColor=Color3.fromRGB(255,85,255),
    Fullbright=false,
    Aimbot=false,AimPart="Head",AimFOV=150,AimSmooth=5,
    AimTeam=true,AimWall=true,ShowFOV=true,SilentAim=false,
    TargetPlayer=nil,TargetLock=false,
    Triggerbot=false,TriggerDelay=0.05,
    Freecam=false,FreecamSpeed=1,AntiCheat=false,
    NotifKillFeed=false,NotifProximity=false,NotifProxDist=50,
    NotifHealth=false,NotifHealthThresh=30,
    TpPlayer=nil,TpSavedPos=nil,
    Spinbot=false,SpinSpeed=20,
    XEnable=false,XType="Isreal",XSize=64,
    XSpin=false,XSpinSpeed=5,XOpacity=1,
    NoRecoil=false,NoSpread=false,
    AutoReload=false,FastShoot=false,FastShootMult=2,
    GunChams=false,GunChamsColor=Color3.fromRGB(0,255,200),
    RemoveShadows=false,RemoveParticles=false,
    RemoveDecals=false,LowGrass=false,ReduceQuality=false,
}

local flyBV,flyBG,freecamCF,origCamType=nil,nil,nil,nil
local origLight,lastHP,notifiedProx={},{},{}
local spinAngle,xhairAngle=0,0

local sg=Instance.new("ScreenGui")
sg.Name="UR_Scr";sg.IgnoreGuiInset=true;sg.ResetOnSpawn=false
pcall(function() sg.Parent=cg end)
if not sg.Parent then sg.Parent=LP:WaitForChild("PlayerGui") end

local espF=Instance.new("Folder");espF.Name="UR_ESP"
pcall(function() espF.Parent=cg end)
if not espF.Parent then espF.Parent=LP:WaitForChild("PlayerGui") end

----------------------------------------------------------------
-- CROSSHAIR
----------------------------------------------------------------
local XIDS={Isreal="84491541822374",["Tung Tung"]="122618878219956"}
local rImgs={}
local function resolveID(id)
    if rImgs[id] then return rImgs[id] end
    local n=tostring(id):match("%d+");if not n then return "" end
    local s,r=pcall(function()
        local o=game:GetObjects("rbxassetid://"..n)
        if o and o[1] and o[1]:IsA("Decal") then return o[1].Texture end
        return nil
    end)
    if s and r then rImgs[id]=r;return r end
    local u="rbxassetid://"..n;rImgs[id]=u;return u
end

local xImg=Instance.new("ImageLabel")
xImg.Name="xh";xImg.AnchorPoint=Vector2.new(0.5,0.5)
xImg.BackgroundTransparency=1;xImg.ScaleType=Enum.ScaleType.Fit
xImg.Visible=false;xImg.ZIndex=999;xImg.Parent=sg

local ldXT=""
local function loadXH(name)
    if ldXT==name then return end
    local id=XIDS[name];if not id then return end
    task.spawn(function()
        xImg.Image=resolveID(id);ldXT=name
        task.wait(2)
        if not xImg.IsLoaded then
            xImg.Image="rbxassetid://"..id;task.wait(1)
            if not xImg.IsLoaded then
                xImg.Image="rbxthumb://type=Asset&id="..id.."&w=420&h=420"
            end
        end
    end)
end

----------------------------------------------------------------
-- NOTIFS
----------------------------------------------------------------
local nH=Instance.new("Frame");nH.Size=UDim2.new(0,260,0.4,0)
nH.Position=UDim2.new(1,-270,0.6,0);nH.BackgroundTransparency=1
nH.ClipsDescendants=true;nH.Parent=sg
local nL=Instance.new("UIListLayout");nL.SortOrder=Enum.SortOrder.LayoutOrder
nL.VerticalAlignment=Enum.VerticalAlignment.Bottom;nL.Padding=UDim.new(0,3);nL.Parent=nH
local nC=0
local function notif(t,c,d)
    nC=nC+1;local f=Instance.new("Frame");f.Size=UDim2.new(1,0,0,22)
    f.BackgroundColor3=Color3.fromRGB(12,12,12);f.BackgroundTransparency=0.15
    f.BorderSizePixel=0;f.LayoutOrder=nC;f.Parent=nH
    Instance.new("UICorner",f).CornerRadius=UDim.new(0,5)
    local st=Instance.new("UIStroke");st.Color=c or Color3.new(1,1,1)
    st.Thickness=1;st.Transparency=0.3;st.Parent=f
    local tl=Instance.new("TextLabel");tl.Size=UDim2.new(1,-8,1,0)
    tl.Position=UDim2.new(0,4,0,0);tl.BackgroundTransparency=1;tl.Text=t
    tl.TextColor3=c or Color3.new(1,1,1);tl.Font=Enum.Font.GothamBold
    tl.TextSize=10;tl.TextXAlignment=Enum.TextXAlignment.Left
    tl.TextTruncate=Enum.TextTruncate.AtEnd;tl.Parent=f
    task.delay(d or 4,function() pcall(function() f:Destroy() end) end)
end

----------------------------------------------------------------
-- FOV
----------------------------------------------------------------
local fovF=Instance.new("Frame");fovF.AnchorPoint=Vector2.new(0.5,0.5)
fovF.BackgroundTransparency=1;fovF.BorderSizePixel=0;fovF.Visible=false;fovF.Parent=sg
Instance.new("UICorner",fovF).CornerRadius=UDim.new(0.5,0)
local fvS=Instance.new("UIStroke");fvS.Color=Color3.new(1,1,1)
fvS.Thickness=1.5;fvS.Transparency=0.3;fvS.Parent=fovF

----------------------------------------------------------------
-- HELPERS
----------------------------------------------------------------
local function ally(p) if not LP.Team or not p.Team then return false end;return LP.Team==p.Team end
local function alive(p)
    local c=p.Character;if not c then return end
    local h=c:FindFirstChildOfClass("Humanoid");local r=c:FindFirstChild("HumanoidRootPart")
    if not h or not r or h.Health<=0 then return end;return c,h,r
end
local function w2s(v) local a,b=Camera:WorldToViewportPoint(v);return Vector2.new(a.X,a.Y),b,a.Z end
local rp=RaycastParams.new();rp.FilterType=Enum.RaycastFilterType.Exclude
local function canSee(pt)
    local o=Camera.CFrame.Position;local d=pt.Position-o
    local fl={};if LP.Character then table.insert(fl,LP.Character) end
    rp.FilterDescendantsInstances=fl;local res=workspace:Raycast(o,d,rp)
    if not res then return true end;local tc=pt.Parent
    return tc and res.Instance:IsDescendantOf(tc)
end
local function pNames()
    local n={};for _,p in ipairs(Players:GetPlayers()) do
        if p~=LP then table.insert(n,p.DisplayName.." (@"..p.Name..")") end
    end;if #n==0 then table.insert(n,"None") end;return n
end
local function findP(v)
    local str=type(v)=="table" and v[1] or v
    if not str or str=="None" then return nil end
    for _,p in ipairs(Players:GetPlayers()) do
        if p~=LP and p.DisplayName.." (@"..p.Name..")"==str then return p end
    end;return nil
end
local function posLine(f,a,b,col)
    local dx=b.X-a.X;local dy=b.Y-a.Y;local len=math.sqrt(dx*dx+dy*dy)
    f.Size=UDim2.new(0,len,0,2);f.Position=UDim2.new(0,(a.X+b.X)/2,0,(a.Y+b.Y)/2)
    f.AnchorPoint=Vector2.new(0.5,0.5);f.Rotation=math.deg(math.atan2(dy,dx))
    f.BackgroundColor3=col;f.Visible=true
end

----------------------------------------------------------------
-- ARROWS
----------------------------------------------------------------
local function mkArrow()
    local h=Instance.new("Frame");h.Size=UDim2.new(0,20,0,20)
    h.AnchorPoint=Vector2.new(0.5,0.5);h.BackgroundTransparency=1
    h.Visible=false;h.ZIndex=900;h.Parent=sg
    local bd=Instance.new("Frame");bd.Size=UDim2.new(0,4,0,14)
    bd.AnchorPoint=Vector2.new(0.5,1);bd.Position=UDim2.new(0.5,0,1,0)
    bd.BorderSizePixel=0;bd.ZIndex=901;bd.Parent=h
    local wl=Instance.new("Frame");wl.Size=UDim2.new(0,3,0,9)
    wl.AnchorPoint=Vector2.new(1,1);wl.Position=UDim2.new(0.5,0,0.35,0)
    wl.Rotation=-35;wl.BorderSizePixel=0;wl.ZIndex=901;wl.Parent=h
    local wr=Instance.new("Frame");wr.Size=UDim2.new(0,3,0,9)
    wr.AnchorPoint=Vector2.new(0,1);wr.Position=UDim2.new(0.5,0,0.35,0)
    wr.Rotation=35;wr.BorderSizePixel=0;wr.ZIndex=901;wr.Parent=h
    return {h=h,bd=bd,wl=wl,wr=wr}
end

----------------------------------------------------------------
-- ESP
----------------------------------------------------------------
local espD={}
local function mkF() local f=Instance.new("Frame");f.BackgroundColor3=Color3.new(1,1,1);f.BorderSizePixel=0;f.Visible=false;f.Parent=sg;return f end
local function buildESP(p)
    if espD[p] then return end
    local fo=Instance.new("Folder");fo.Name=p.Name;fo.Parent=espF
    local bb=Instance.new("BillboardGui");bb.Size=UDim2.new(0,250,0,18)
    bb.StudsOffset=Vector3.new(0,2.8,0);bb.AlwaysOnTop=true;bb.Parent=fo
    local il=Instance.new("TextLabel");il.Size=UDim2.new(1,0,1,0)
    il.BackgroundTransparency=1;il.TextStrokeTransparency=0
    il.TextStrokeColor3=Color3.new(0,0,0);il.Font=Enum.Font.GothamBold
    il.TextSize=12;il.Text="";il.Parent=bb
    local hb=Instance.new("BillboardGui");hb.Size=UDim2.new(1,0,1,0)
    hb.AlwaysOnTop=true;hb.Parent=fo
    local hf=Instance.new("Frame");hf.Size=UDim2.new(1,0,1,0)
    hf.BackgroundTransparency=0.5;hf.Parent=hb
    Instance.new("UICorner",hf).CornerRadius=UDim.new(0.5,0)
    local hs=Instance.new("UIStroke");hs.Thickness=1.5;hs.Parent=hf
    espD[p]={fo=fo,bb=bb,il=il,hb=hb,hf=hf,hs=hs,tr=mkF(),hl=nil,ar=mkArrow()}
end
local function clearESP(p)
    local d=espD[p];if not d then return end
    pcall(function() d.fo:Destroy() end);pcall(function() d.tr:Destroy() end)
    if d.hl then pcall(function() d.hl:Destroy() end) end
    if d.ar then pcall(function() d.ar.h:Destroy() end) end;espD[p]=nil
end
local function updateESP(p)
    local d=espD[p];if not d then return end
    local c,hum,hrp=alive(p);local bl=S.TeamCheck and ally(p)
    local any=S.Chams or S.ESPName or S.ESPHealth or S.ESPDist or S.ESPBox or S.ESPHead or S.ESPTracer or S.ESPArrow
    if not c or not any or bl then
        d.bb.Enabled=false;d.hb.Enabled=false;d.tr.Visible=false
        if d.hl then pcall(function() d.hl:Destroy() end);d.hl=nil end
        d.ar.h.Visible=false;return
    end
    local head=c:FindFirstChild("Head");local col=S.ESPColor
    local pos,onScr=w2s(hrp.Position)
    if S.ESPArrow and not onScr then
        local vps=Camera.ViewportSize;local cx,cy=vps.X/2,vps.Y/2
        local ang=math.atan2(pos.Y-cy,pos.X-cx)
        local rad=math.min(cx,cy)*S.ESPArrowRadius
        d.ar.h.Position=UDim2.new(0,cx+math.cos(ang)*rad,0,cy+math.sin(ang)*rad)
        d.ar.h.Rotation=math.deg(ang)+90
        d.ar.h.Size=UDim2.new(0,S.ESPArrowSize,0,S.ESPArrowSize)
        d.ar.bd.BackgroundColor3=col;d.ar.wl.BackgroundColor3=col;d.ar.wr.BackgroundColor3=col
        d.ar.h.Visible=true
    else d.ar.h.Visible=false end
    if head then d.bb.Adornee=head end
    d.bb.Enabled=(S.ESPName or S.ESPHealth or S.ESPDist) and onScr
    if d.bb.Enabled then
        local pts={}
        if S.ESPName then table.insert(pts,p.DisplayName) end
        if S.ESPHealth and hum then table.insert(pts,"["..math.floor(hum.Health).."/"..math.floor(hum.MaxHealth).."]") end
        if S.ESPDist then local mc=LP.Character;if mc and mc:FindFirstChild("HumanoidRootPart") then table.insert(pts,math.floor((mc.HumanoidRootPart.Position-hrp.Position).Magnitude).."m") end end
        d.il.Text=table.concat(pts," ")
        if S.ESPHealth and hum then local r=hum.Health/hum.MaxHealth;d.il.TextColor3=Color3.fromRGB(255*(1-r)+col.R*255*r,255*r*0.8,col.B*255*0.3)
        else d.il.TextColor3=col end
    end
    if S.ESPHead and head and onScr then d.hb.Adornee=head;d.hb.Enabled=true;d.hf.BackgroundColor3=col;d.hf.BackgroundTransparency=0.6;d.hs.Color=col else d.hb.Enabled=false end
    if S.ESPTracer and onScr then local vps=Camera.ViewportSize;posLine(d.tr,Vector2.new(vps.X/2,vps.Y),pos,col) else d.tr.Visible=false end
    if S.Chams or S.ESPBox then
        if not d.hl or not d.hl.Parent then d.hl=Instance.new("Highlight");d.hl.Adornee=c;d.hl.Parent=d.fo end
        d.hl.Adornee=c
        if S.Chams and S.ESPBox then d.hl.FillColor=col;d.hl.FillTransparency=0.6;d.hl.OutlineColor=col;d.hl.OutlineTransparency=0
        elseif S.Chams then d.hl.FillColor=col;d.hl.FillTransparency=0.6;d.hl.OutlineColor=Color3.new(1,1,1);d.hl.OutlineTransparency=0
        else d.hl.FillTransparency=1;d.hl.OutlineColor=col;d.hl.OutlineTransparency=0 end
    else if d.hl then pcall(function() d.hl:Destroy() end);d.hl=nil end end
end

----------------------------------------------------------------
-- AIMBOT
----------------------------------------------------------------
local function bestTgt()
    if S.TargetLock and S.TargetPlayer then
        local c,h,r=alive(S.TargetPlayer);if not c then return nil end
        local pt=c:FindFirstChild(S.AimPart) or c:FindFirstChild("Head")
        if pt and (not S.AimWall or canSee(pt)) then
            local sp,vis=w2s(pt.Position);if vis then local vps=Camera.ViewportSize
                if (sp-Vector2.new(vps.X/2,vps.Y/2)).Magnitude<S.AimFOV then return pt end
            end
        end;return nil
    end
    local best,bestD=nil,S.AimFOV;local vps=Camera.ViewportSize;local ctr=Vector2.new(vps.X/2,vps.Y/2)
    for _,p in ipairs(Players:GetPlayers()) do
        if p==LP then continue end;if S.AimTeam and ally(p) then continue end
        local c,h,r=alive(p);if not c then continue end
        local pt=c:FindFirstChild(S.AimPart) or c:FindFirstChild("Head");if not pt then continue end
        if S.AimWall and not canSee(pt) then continue end
        local sp,vis=w2s(pt.Position);if not vis then continue end
        local dist=(sp-ctr).Magnitude;if dist<bestD then bestD=dist;best=pt end
    end;return best
end
RS:BindToRenderStep("UR_Aim",Enum.RenderPriority.Camera.Value+1,function()
    if S.Freecam or not S.Aimbot or S.SilentAim then return end
    local tgt=bestTgt();if not tgt then return end
    Camera.CFrame=Camera.CFrame:Lerp(CFrame.lookAt(Camera.CFrame.Position,tgt.Position),1/S.AimSmooth)
end)
pcall(function()
    if not hookmetamethod then return end;local old
    old=hookmetamethod(game,"__namecall",function(self,...)
        local m=getnamecallmethod()
        if S.SilentAim and S.Aimbot and (m=="FindPartOnRayWithIgnoreList" or m=="FindPartOnRay" or m=="FindPartOnRayWithWhitelist") then
            local tgt=bestTgt();if tgt then local o=Camera.CFrame.Position;return old(self,Ray.new(o,(tgt.Position-o).Unit*1000),...) end
        end;return old(self,...)
    end)
end)

----------------------------------------------------------------
-- GUN — getgc scan
----------------------------------------------------------------
local GK={
    recoil={"recoil","camrecoil","camkick","kickback","verticalrecoil","horizontalrecoil"},
    spread={"spread","bloom","accuracy","hipspread","aimspread","bulletspread","inaccuracy"},
    firerate={"firerate","rpm","cooldown","firedelay","shootcooldown","timebetweenshots"},
    reload={"reloadtime","reloadspeed","reloadduration"},
    ammo={"magsize","clipsize","maxammo","magazinesize"},
}
local function kMatch(k,pats) local kk=tostring(k):lower():gsub("[_ ]","");for _,p in ipairs(pats) do if kk==p or kk:find(p,1,true) then return true end end;return false end
local gunCfgs,lastGS={},0
local function scanGuns()
    gunCfgs={}
    if getgc then
        for _,obj in ipairs(getgc(true)) do
            if type(obj)~="table" then continue end
            local entry={t=obj,k={}}
            for key,val in pairs(obj) do
                if type(val)~="number" then continue end
                for kind,pats in pairs(GK) do if kMatch(key,pats) then table.insert(entry.k,{key=key,kind=kind,orig=val}) end end
            end
            if #entry.k>=2 then table.insert(gunCfgs,entry) end
        end
    else
        local char=LP.Character;if not char then return end
        local tool=char:FindFirstChildOfClass("Tool");if not tool then return end
        for _,desc in ipairs(tool:GetDescendants()) do
            if desc:IsA("NumberValue") or desc:IsA("IntValue") then
                for kind,pats in pairs(GK) do if kMatch(desc.Name,pats) then table.insert(gunCfgs,{vo=desc,k={{key=desc.Name,kind=kind,orig=desc.Value}}}) end end
            end
        end
        for _,desc in ipairs(tool:GetDescendants()) do
            if desc:IsA("ModuleScript") then pcall(function()
                local mod=require(desc);if type(mod)~="table" then return end
                local entry={t=mod,k={}}
                for key,val in pairs(mod) do if type(val)~="number" then continue end
                    for kind,pats in pairs(GK) do if kMatch(key,pats) then table.insert(entry.k,{key=key,kind=kind,orig=val}) end end
                end;if #entry.k>0 then table.insert(gunCfgs,entry) end
            end) end
        end
    end
end
local preCF=nil
local function applyGun()
    if tick()-lastGS>3 then scanGuns();lastGS=tick() end
    for _,cfg in ipairs(gunCfgs) do for _,k in ipairs(cfg.k) do
        if k.kind=="recoil" and S.NoRecoil then if cfg.t then pcall(function() cfg.t[k.key]=0 end) elseif cfg.vo then pcall(function() cfg.vo.Value=0 end) end end
        if k.kind=="spread" and S.NoSpread then if cfg.t then pcall(function() cfg.t[k.key]=0 end) elseif cfg.vo then pcall(function() cfg.vo.Value=0 end) end end
        if k.kind=="firerate" and S.FastShoot then local m=S.FastShootMult;if cfg.t then pcall(function() cfg.t[k.key]=k.orig>10 and k.orig*m or k.orig/m end) elseif cfg.vo then pcall(function() cfg.vo.Value=k.orig>10 and k.orig*m or k.orig/m end) end end
        if k.kind=="reload" and S.AutoReload then if cfg.t then pcall(function() cfg.t[k.key]=0.001 end) elseif cfg.vo then pcall(function() cfg.vo.Value=0.001 end) end end
        if k.kind=="ammo" and S.AutoReload then if cfg.t then pcall(function() if cfg.t[k.key]<k.orig*0.3 then cfg.t[k.key]=k.orig end end) elseif cfg.vo then pcall(function() if cfg.vo.Value<k.orig*0.3 then cfg.vo.Value=k.orig end end) end end
    end end
    if S.NoRecoil and preCF then
        local dot=Camera.CFrame.LookVector:Dot(preCF.LookVector)
        if dot>0.997 and dot<0.9999 then local p=Camera.CFrame.Position;local ol=preCF.LookVector;local nl=Camera.CFrame.LookVector
            Camera.CFrame=CFrame.lookAt(p,p+Vector3.new(nl.X,ol.Y,nl.Z))
        end
    end;preCF=Camera.CFrame
end
local gcHL=nil
local function gunChams()
    local char=LP.Character;if not char then return end;local tool=char:FindFirstChildOfClass("Tool")
    if S.GunChams and tool then
        if not gcHL or not gcHL.Parent or gcHL.Adornee~=tool then
            if gcHL then pcall(function() gcHL:Destroy() end) end
            gcHL=Instance.new("Highlight");gcHL.Adornee=tool;gcHL.FillColor=S.GunChamsColor
            gcHL.FillTransparency=0.3;gcHL.OutlineColor=S.GunChamsColor;gcHL.OutlineTransparency=0;gcHL.Parent=tool
        else gcHL.FillColor=S.GunChamsColor;gcHL.OutlineColor=S.GunChamsColor end
    else if gcHL then pcall(function() gcHL:Destroy() end);gcHL=nil end end
end

----------------------------------------------------------------
-- TRIGGERBOT / FREECAM / AC / NOTIFS / SPINBOT / OPT
----------------------------------------------------------------
local lastTrig=0
local function trigChk()
    if not S.Triggerbot or tick()-lastTrig<S.TriggerDelay then return end
    local m=LP:GetMouse();if not m or not m.Target then return end
    local hp=Players:GetPlayerFromCharacter(m.Target.Parent) or Players:GetPlayerFromCharacter(m.Target.Parent and m.Target.Parent.Parent)
    if hp and hp~=LP and not(S.AimTeam and ally(hp)) then
        pcall(function() game:GetService("VirtualUser"):ClickButton1(Vector2.new(0,0),Camera.CFrame) end)
        pcall(function() local t=LP.Character and LP.Character:FindFirstChildOfClass("Tool");if t then t:Activate() end end)
        lastTrig=tick()
    end
end
local function startFC() origCamType=Camera.CameraType;freecamCF=Camera.CFrame;Camera.CameraType=Enum.CameraType.Scriptable end
local function stopFC() Camera.CameraType=origCamType or Enum.CameraType.Custom;origCamType=nil;freecamCF=nil end
local function updFC(dt)
    if not S.Freecam or not freecamCF then return end;Camera.CameraType=Enum.CameraType.Scriptable
    local hum=LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
    local md=hum and hum.MoveDirection or Vector3.zero;local sp=S.FreecamSpeed*60*dt;local cf=Camera.CFrame
    local mv=Vector3.zero;if md.Magnitude>0 then mv=(cf.LookVector*md.Z*-1+cf.RightVector*md.X).Unit*sp end
    freecamCF=cf+mv;Camera.CFrame=freecamCF
end
local function enableAC()
    pcall(function() LP.Idled:Connect(function() local v=game:GetService("VirtualUser");v:Button2Down(Vector2.new(0,0),Camera.CFrame);task.wait(0.1);v:Button2Up(Vector2.new(0,0),Camera.CFrame) end) end)
    pcall(function() if not hookmetamethod then return end;local oi;oi=hookmetamethod(game,"__index",function(s,k) if S.AntiCheat and s:IsA("Humanoid") then if k=="WalkSpeed" then return 16 end;if k=="JumpPower" then return 50 end end;return oi(s,k) end) end)
    notif("Anti-cheat on",Color3.fromRGB(0,255,100),3)
end
local function notifChk()
    if S.NotifProximity then local myH=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart");if myH then for _,p in ipairs(Players:GetPlayers()) do if p~=LP then local c,h,r=alive(p);if c and r then local d=(myH.Position-r.Position).Magnitude;if d<=S.NotifProxDist then if not notifiedProx[p] then notifiedProx[p]=true;notif("!! "..p.DisplayName.." "..math.floor(d).."m",Color3.fromRGB(255,200,0),3) end else notifiedProx[p]=nil end end end end end end
    if S.NotifHealth then local hum=LP.Character and LP.Character:FindFirstChildOfClass("Humanoid");if hum then local hp=hum.Health;local pv=lastHP["s"] or hum.MaxHealth;if hp<=S.NotifHealthThresh and pv>S.NotifHealthThresh then notif("!! LOW HP: "..math.floor(hp),Color3.fromRGB(255,50,50),3) end;lastHP["s"]=hp end end
end
local function wireKF(p)
    local function hk(c) local h=c:WaitForChild("Humanoid",5);if h then h.Died:Connect(function() if S.NotifKillFeed then notif(p.DisplayName.." eliminated",Color3.fromRGB(255,100,100),4) end end) end end
    p.CharacterAdded:Connect(hk);if p.Character then pcall(hk,p.Character) end
end
for _,p in ipairs(Players:GetPlayers()) do wireKF(p) end
Players.PlayerAdded:Connect(function(p) wireKF(p) end)
local function updSpin(dt)
    if not S.Spinbot then return end;local c=LP.Character;if not c then return end
    local hrp=c:FindFirstChild("HumanoidRootPart");if not hrp then return end
    spinAngle=spinAngle+S.SpinSpeed*dt*360;if spinAngle>360 then spinAngle=spinAngle-360 end
    local p=hrp.CFrame.Position;hrp.CFrame=CFrame.lookAt(p,p+CFrame.Angles(0,math.rad(spinAngle),0).LookVector)
end
local optd={}
local function applyOpt()
    if S.RemoveShadows and not optd.sh then Lighting.GlobalShadows=false;Lighting.FogEnd=1e9;optd.sh=true end
    if S.RemoveParticles and not optd.pa then for _,v in ipairs(workspace:GetDescendants()) do if v:IsA("ParticleEmitter") or v:IsA("Fire") or v:IsA("Smoke") or v:IsA("Sparkles") or v:IsA("Trail") then pcall(function() v.Enabled=false end) end end;optd.pa=true end
    if S.RemoveDecals and not optd.de then for _,v in ipairs(workspace:GetDescendants()) do if v:IsA("Decal") or v:IsA("Texture") then pcall(function() v.Transparency=1 end) end end;optd.de=true end
    if S.LowGrass and not optd.gr then pcall(function() workspace:FindFirstChildOfClass("Terrain").Decoration=false end);optd.gr=true end
    if S.ReduceQuality and not optd.qu then pcall(function() settings().Rendering.QualityLevel=Enum.QualityLevel.Level01 end);for _,v in ipairs(Lighting:GetDescendants()) do if v:IsA("BlurEffect") or v:IsA("BloomEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("DepthOfFieldEffect") then pcall(function() v.Enabled=false end) end end;optd.qu=true end
end

----------------------------------------------------------------
-- TABS
----------------------------------------------------------------
local MT=Window:CreateTab("Movement",4483362458)
MT:CreateSection("Speed");MT:CreateToggle({Name="Speed Boost",CurrentValue=false,Flag="spd",Callback=function(v) S.Speed=v end})
MT:CreateSlider({Name="Multiplier",Range={1,10},Increment=0.5,Suffix="x",CurrentValue=3,Flag="spdv",Callback=function(v) S.SpeedVal=v end})
MT:CreateSection("Jump");MT:CreateToggle({Name="Jump Boost",CurrentValue=false,Flag="jmp",Callback=function(v) S.Jump=v end})
MT:CreateSlider({Name="Force",Range={50,400},Increment=5,Suffix="",CurrentValue=120,Flag="jmpv",Callback=function(v) S.JumpVal=v end})
MT:CreateToggle({Name="Infinite Jump",CurrentValue=false,Flag="ijmp",Callback=function(v) S.InfJump=v end})
MT:CreateSection("Movement");MT:CreateToggle({Name="Noclip",CurrentValue=false,Flag="nclp",Callback=function(v) S.Noclip=v end})
MT:CreateToggle({Name="Fly",CurrentValue=false,Flag="fly",Callback=function(v) S.Fly=v;local c=LP.Character;if not c then return end;local h=c:FindFirstChild("HumanoidRootPart");if not h then return end;if v then for _,ch in ipairs(h:GetChildren()) do if ch:IsA("BodyVelocity") or ch:IsA("BodyGyro") then pcall(function() ch:Destroy() end) end end;flyBV=Instance.new("BodyVelocity");flyBV.MaxForce=Vector3.new(1e5,1e5,1e5);flyBV.Velocity=Vector3.zero;flyBV.Parent=h;flyBG=Instance.new("BodyGyro");flyBG.MaxTorque=Vector3.new(1e5,1e5,1e5);flyBG.D=100;flyBG.P=10000;flyBG.Parent=h else if flyBV then pcall(function() flyBV:Destroy() end);flyBV=nil end;if flyBG then pcall(function() flyBG:Destroy() end);flyBG=nil end end end})
MT:CreateSlider({Name="Fly Speed",Range={10,300},Increment=5,Suffix="",CurrentValue=60,Flag="flyv",Callback=function(v) S.FlySpeed=v end})
MT:CreateSection("Spinbot");MT:CreateToggle({Name="Spinbot",CurrentValue=false,Flag="spin",Callback=function(v) S.Spinbot=v;spinAngle=0 end})
MT:CreateSlider({Name="Speed",Range={1,50},Increment=1,Suffix="rps",CurrentValue=20,Flag="spnspd",Callback=function(v) S.SpinSpeed=v end})
MT:CreateSection("Freecam");MT:CreateToggle({Name="Freecam",CurrentValue=false,Flag="fcam",Callback=function(v) S.Freecam=v;if v then startFC() else stopFC() end end})
MT:CreateSlider({Name="Speed",Range={0.5,5},Increment=0.25,Suffix="x",CurrentValue=1,Flag="fcspd",Callback=function(v) S.FreecamSpeed=v end})
MT:CreateSection("Teleport");MT:CreateDropdown({Name="Player",Options=pNames(),CurrentOption={},Flag="tpp",Callback=function(v) S.TpPlayer=findP(v) end})
MT:CreateButton({Name="Teleport",Callback=function() if not S.TpPlayer then notif("Pick player",Color3.new(1,.3,.3),2);return end;local c,h,r=alive(S.TpPlayer);local my=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart");if r and my then my.CFrame=r.CFrame+Vector3.new(0,3,0);notif("TP->"..S.TpPlayer.DisplayName,Color3.fromRGB(100,200,255),2) end end})
MT:CreateButton({Name="Save Pos",Callback=function() local my=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart");if my then S.TpSavedPos=my.CFrame;notif("Saved",Color3.fromRGB(100,255,100),2) end end})
MT:CreateButton({Name="Load Pos",Callback=function() if not S.TpSavedPos then return end;local my=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart");if my then my.CFrame=S.TpSavedPos;notif("Loaded",Color3.fromRGB(100,255,100),2) end end})

local ET=Window:CreateTab("ESP",4483362458)
ET:CreateSection("Player ESP")
ET:CreateToggle({Name="Chams",CurrentValue=false,Flag="chm",Callback=function(v) S.Chams=v end})
ET:CreateToggle({Name="Box",CurrentValue=false,Flag="ebox",Callback=function(v) S.ESPBox=v end})
ET:CreateToggle({Name="Head Dot",CurrentValue=false,Flag="ehd",Callback=function(v) S.ESPHead=v end})
ET:CreateToggle({Name="Name",CurrentValue=false,Flag="enm",Callback=function(v) S.ESPName=v end})
ET:CreateToggle({Name="Health",CurrentValue=false,Flag="ehp",Callback=function(v) S.ESPHealth=v end})
ET:CreateToggle({Name="Distance",CurrentValue=false,Flag="edst",Callback=function(v) S.ESPDist=v end})
ET:CreateToggle({Name="Tracers",CurrentValue=false,Flag="etrc",Callback=function(v) S.ESPTracer=v end})
ET:CreateSection("Offscreen");ET:CreateToggle({Name="Arrows",CurrentValue=false,Flag="earr",Callback=function(v) S.ESPArrow=v end})
ET:CreateSlider({Name="Size",Range={12,40},Increment=2,Suffix="px",CurrentValue=20,Flag="earrsz",Callback=function(v) S.ESPArrowSize=v end})
ET:CreateSlider({Name="Radius",Range={0.15,0.45},Increment=0.05,Suffix="",CurrentValue=0.3,Flag="earrr",Callback=function(v) S.ESPArrowRadius=v end})
ET:CreateSection("Settings");ET:CreateToggle({Name="Skip Teammates",CurrentValue=true,Flag="etc",Callback=function(v) S.TeamCheck=v end})
ET:CreateColorPicker({Name="Color",Color=Color3.fromRGB(255,85,255),Flag="ecol",Callback=function(v) S.ESPColor=v end})
ET:CreateToggle({Name="Fullbright",CurrentValue=false,Flag="fb",Callback=function(v) S.Fullbright=v;if v then origLight.B=Lighting.Brightness;origLight.C=Lighting.ClockTime;origLight.F=Lighting.FogEnd;origLight.G=Lighting.GlobalShadows;Lighting.Brightness=2;Lighting.ClockTime=14;Lighting.FogEnd=1e6;Lighting.GlobalShadows=false else Lighting.Brightness=origLight.B or 1;Lighting.ClockTime=origLight.C or 14;Lighting.FogEnd=origLight.F or 1e4;Lighting.GlobalShadows=origLight.G~=false end end})

local AT=Window:CreateTab("Aimbot",4483362458)
AT:CreateSection("Aimbot");AT:CreateToggle({Name="Enable",CurrentValue=false,Flag="aim",Callback=function(v) S.Aimbot=v end})
AT:CreateToggle({Name="Silent Aim",CurrentValue=false,Flag="saim",Callback=function(v) S.SilentAim=v end})
AT:CreateDropdown({Name="Part",Options={"Head","HumanoidRootPart","UpperTorso","LowerTorso"},CurrentOption={"Head"},Flag="apart",Callback=function(v) S.AimPart=type(v)=="table" and v[1] or v end})
AT:CreateSlider({Name="FOV",Range={30,500},Increment=5,Suffix="px",CurrentValue=150,Flag="afov",Callback=function(v) S.AimFOV=v end})
AT:CreateSlider({Name="Smooth (1=snap)",Range={1,30},Increment=1,Suffix="x",CurrentValue=5,Flag="asm",Callback=function(v) S.AimSmooth=v end})
AT:CreateSection("Lock");AT:CreateToggle({Name="Lock Target",CurrentValue=false,Flag="tlock",Callback=function(v) S.TargetLock=v end})
AT:CreateDropdown({Name="Target",Options=pNames(),CurrentOption={},Flag="tsel",Callback=function(v) S.TargetPlayer=findP(v) end})
AT:CreateSection("Triggerbot");AT:CreateToggle({Name="Triggerbot",CurrentValue=false,Flag="tbot",Callback=function(v) S.Triggerbot=v end})
AT:CreateSlider({Name="Delay",Range={0,0.5},Increment=0.01,Suffix="s",CurrentValue=0.05,Flag="tdel",Callback=function(v) S.TriggerDelay=v end})
AT:CreateSection("Filters");AT:CreateToggle({Name="Skip Teammates",CurrentValue=true,Flag="atc",Callback=function(v) S.AimTeam=v end})
AT:CreateToggle({Name="Wall Check",CurrentValue=true,Flag="awc",Callback=function(v) S.AimWall=v end})
AT:CreateToggle({Name="FOV Circle",CurrentValue=true,Flag="sfov",Callback=function(v) S.ShowFOV=v end})

local CT=Window:CreateTab("Crosshair",4483362458)
CT:CreateSection("Crosshair");CT:CreateToggle({Name="Enable",CurrentValue=false,Flag="xen",Callback=function(v) S.XEnable=v;ldXT="" end})
CT:CreateDropdown({Name="Style",Options={"Isreal","Tung Tung"},CurrentOption={"Isreal"},Flag="xtype",Callback=function(v) S.XType=type(v)=="table" and v[1] or v;ldXT="" end})
CT:CreateSlider({Name="Size",Range={16,256},Increment=4,Suffix="px",CurrentValue=64,Flag="xsz",Callback=function(v) S.XSize=v end})
CT:CreateSlider({Name="Opacity",Range={0.1,1},Increment=0.1,Suffix="",CurrentValue=1,Flag="xop",Callback=function(v) S.XOpacity=v end})
CT:CreateSection("Spin");CT:CreateToggle({Name="Spin",CurrentValue=false,Flag="xspin",Callback=function(v) S.XSpin=v;xhairAngle=0 end})
CT:CreateSlider({Name="Speed",Range={0.5,20},Increment=0.5,Suffix="rps",CurrentValue=5,Flag="xsspd",Callback=function(v) S.XSpinSpeed=v end})
CT:CreateParagraph({Title="IDs",Content="Isreal: 84491541822374\nTung Tung: 122618878219956\nUses game:GetObjects to resolve decal texture"})

local GT=Window:CreateTab("Gun",4483362458)
GT:CreateSection("Recoil");GT:CreateToggle({Name="No Recoil",CurrentValue=false,Flag="nrc",Callback=function(v) S.NoRecoil=v end})
GT:CreateToggle({Name="No Spread",CurrentValue=false,Flag="nsp",Callback=function(v) S.NoSpread=v end})
GT:CreateSection("Fire Rate");GT:CreateToggle({Name="Fast Shoot",CurrentValue=false,Flag="fsh",Callback=function(v) S.FastShoot=v end})
GT:CreateSlider({Name="Multiplier",Range={1,5},Increment=0.5,Suffix="x",CurrentValue=2,Flag="fshm",Callback=function(v) S.FastShootMult=v end})
GT:CreateSection("Reload");GT:CreateToggle({Name="Auto Reload",CurrentValue=false,Flag="arl",Callback=function(v) S.AutoReload=v end})
GT:CreateSection("Visuals");GT:CreateToggle({Name="Gun Chams",CurrentValue=false,Flag="gcham",Callback=function(v) S.GunChams=v end})
GT:CreateColorPicker({Name="Color",Color=Color3.fromRGB(0,255,200),Flag="gcol",Callback=function(v) S.GunChamsColor=v end})
GT:CreateParagraph({Title="Info",Content="Uses getgc() to find gun configs in memory. Camera anti-recoil locks pitch. Falls back to tool scan if getgc unavailable."})

local OT=Window:CreateTab("Optimization",4483362458)
OT:CreateSection("Performance")
OT:CreateToggle({Name="Remove Shadows",CurrentValue=false,Flag="osh",Callback=function(v) S.RemoveShadows=v;if v then applyOpt() end end})
OT:CreateToggle({Name="Remove Particles",CurrentValue=false,Flag="opar",Callback=function(v) S.RemoveParticles=v;if v then applyOpt() end end})
OT:CreateToggle({Name="Remove Decals",CurrentValue=false,Flag="odec",Callback=function(v) S.RemoveDecals=v;if v then applyOpt() end end})
OT:CreateToggle({Name="Remove Grass",CurrentValue=false,Flag="ogrs",Callback=function(v) S.LowGrass=v;if v then applyOpt() end end})
OT:CreateToggle({Name="Lowest Quality",CurrentValue=false,Flag="oqal",Callback=function(v) S.ReduceQuality=v;if v then applyOpt() end end})
OT:CreateButton({Name="Apply All",Callback=function() S.RemoveShadows=true;S.RemoveParticles=true;S.RemoveDecals=true;S.LowGrass=true;S.ReduceQuality=true;applyOpt();notif("All applied",Color3.fromRGB(0,255,100),3) end})

local MiT=Window:CreateTab("Misc",4483362458)
MiT:CreateSection("Anti-Cheat");MiT:CreateToggle({Name="Anti-Cheat Bypass",CurrentValue=false,Flag="ac",Callback=function(v) S.AntiCheat=v;if v then enableAC() end end})
MiT:CreateSection("Notifications")
MiT:CreateToggle({Name="Kill Feed",CurrentValue=false,Flag="nkf",Callback=function(v) S.NotifKillFeed=v end})
MiT:CreateToggle({Name="Proximity Alert",CurrentValue=false,Flag="nprox",Callback=function(v) S.NotifProximity=v;notifiedProx={} end})
MiT:CreateSlider({Name="Distance",Range={10,100},Increment=5,Suffix="m",CurrentValue=50,Flag="npdist",Callback=function(v) S.NotifProxDist=v end})
MiT:CreateToggle({Name="Low HP Warning",CurrentValue=false,Flag="nhp",Callback=function(v) S.NotifHealth=v end})
MiT:CreateSlider({Name="Threshold",Range={5,50},Increment=5,Suffix="hp",CurrentValue=30,Flag="nhpt",Callback=function(v) S.NotifHealthThresh=v end})
MiT:CreateParagraph({Title="Urban Reload",Content=".gg/Kc9Ecy7uyR"})

----------------------------------------------------------------
-- HEARTBEAT
----------------------------------------------------------------
RS.Heartbeat:Connect(function(dt)
    local char=LP.Character;if not char then return end
    local hum=char:FindFirstChildOfClass("Humanoid")
    local hrp=char:FindFirstChild("HumanoidRootPart")
    if S.Speed and hum and hrp and hum.MoveDirection.Magnitude>0 then local b=hum.MoveDirection*(S.SpeedVal-1)*dt*60;hrp.CFrame=hrp.CFrame+Vector3.new(b.X,0,b.Z) end
    if S.Jump and hum then hum.JumpPower=S.JumpVal;hum.UseJumpPower=true end
    if S.Noclip and char then for _,p in ipairs(char:GetDescendants()) do if p:IsA("BasePart") then p.CanCollide=false end end end
    if S.Fly and flyBV and hum and hrp then local d=hum.MoveDirection;if d.Magnitude>0 then local cf=Camera.CFrame;local mv=cf.LookVector*d.Z*-1+cf.RightVector*d.X;if mv.Magnitude>0 then mv=mv.Unit end;flyBV.Velocity=mv*S.FlySpeed else flyBV.Velocity=Vector3.zero end;if flyBG then flyBG.CFrame=Camera.CFrame end;hum:ChangeState(Enum.HumanoidStateType.Physics) end
    if S.Freecam then updFC(dt) end;updSpin(dt)
    if S.XEnable then local vps=Camera.ViewportSize;xImg.Position=UDim2.new(0,vps.X/2,0,vps.Y/2);xImg.Size=UDim2.new(0,S.XSize,0,S.XSize);xImg.ImageTransparency=1-S.XOpacity;xImg.Visible=true;loadXH(S.XType);if S.XSpin then xhairAngle=xhairAngle+S.XSpinSpeed*dt*360;if xhairAngle>360 then xhairAngle=xhairAngle-360 end;xImg.Rotation=xhairAngle else xImg.Rotation=0 end else xImg.Visible=false end
    applyGun();gunChams()
    local vps=Camera.ViewportSize;if S.Aimbot and S.ShowFOV then fovF.Size=UDim2.new(0,S.AimFOV*2,0,S.AimFOV*2);fovF.Position=UDim2.new(0,vps.X/2,0,vps.Y/2);fovF.Visible=true else fovF.Visible=false end
    trigChk();notifChk()
    for _,p in ipairs(Players:GetPlayers()) do if p~=LP then buildESP(p);updateESP(p) end end
end)

UIS.JumpRequest:Connect(function()
    if S.Freecam and freecamCF then freecamCF=freecamCF+Vector3.new(0,S.FreecamSpeed*2,0);Camera.CFrame=freecamCF;return end
    if S.InfJump then local c=LP.Character;if c then local h=c:FindFirstChildOfClass("Humanoid");if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end end end
end)

Players.PlayerRemoving:Connect(function(p) clearESP(p);notifiedProx[p]=nil end)
local function wireS(p) p.CharacterAdded:Connect(function() clearESP(p);task.wait(1.5);buildESP(p) end) end
for _,p in ipairs(Players:GetPlayers()) do if p~=LP then wireS(p) end end
Players.PlayerAdded:Connect(function(p) wireS(p);wireKF(p) end)
LP.CharacterAdded:Connect(function(c) if flyBV then pcall(function() flyBV:Destroy() end);flyBV=nil end;if flyBG then pcall(function() flyBG:Destroy() end);flyBG=nil end;spinAngle=0;lastHP["s"]=nil;gunCfgs={};preCF=nil;if gcHL then pcall(function() gcHL:Destroy() end);gcHL=nil end;if S.Fly then task.wait(0.5);local h=c:WaitForChild("HumanoidRootPart",5);if h then flyBV=Instance.new("BodyVelocity");flyBV.MaxForce=Vector3.new(1e5,1e5,1e5);flyBV.Velocity=Vector3.zero;flyBV.Parent=h;flyBG=Instance.new("BodyGyro");flyBG.MaxTorque=Vector3.new(1e5,1e5,1e5);flyBG.D=100;flyBG.P=10000;flyBG.Parent=h end end end)

Rayfield:Notify({Title="Urban Reload",Content="loaded — .gg/Kc9Ecy7uyR",Duration=4})
