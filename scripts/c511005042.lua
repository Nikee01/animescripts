--Hell Centipede
--  By Shad3

local scard=c511005042

function scard.initial_effect(c)
  local e1=Effect.CreateEffect(c)
  e1:SetType(EFFECT_TYPE_SINGLE)
  e1:SetCode(EVENT_SUMMON_PROC)
  e1:SetProperty(EFFECT_FLAG_CANNOT_DISABLE+EFFECT_FLAG_UNCOPYABLE)
  e1:SetCondition(scard.sum_cd)
  e1:SetDescription(aux.Stringid(511005042,0))
  c:RegisterEffect(e1)
end

function scard.sum_cd(e,c)
  if c==nil then return true end
  local tp=c:GetControler()
	return c:GetLevel()>4
    and Duel.GetFieldGroupCount(tp,LOCATION_MZONE,0)==0
    and Duel.GetFieldGroupCount(tp,0,LOCATION_MZONE)>0
    and Duel.GetLocationCount(tp,LOCATION_MZONE)>0
end