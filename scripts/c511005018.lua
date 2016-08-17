--Balance Blaster
--  By Shad3

local scard=c511005018

function scard.initial_effect(c)
  --Global Reg
  if not scard['gl_reg'] then
    scard['gl_reg']=true
    local ge1=Effect.GlobalEffect()
    ge1:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
    ge1:SetCode(EVENT_ADJUST)
    ge1:SetOperation(scard.flag_op)
    Duel.RegisterEffect(ge1,0)
  end
  local e1=Effect.CreateEffect(c)
  e1:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
  e1:SetCode(511005018)
  e1:SetCategory(CATEGORY_DAMAGE)
  e1:SetRange(LOCATION_MZONE)
  e1:SetCondition(scard.cd)
  e1:SetOperation(scard.op)
  c:RegisterEffect(e1)
end

function scard.flag_reg(c)
  if c:IsFaceup() and c:GetFlagEffect(511005018)==0 then
    local e1=Effect.CreateEffect(c)
    e1:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
    e1:SetCode(EVENT_ADJUST)
    e1:SetRange(LOCATION_MZONE)
    e1:SetProperty(EFFECT_FLAG_CANNOT_DISABLE+EFFECT_FLAG_UNCOPYABLE)
    e1:SetReset(RESET_EVENT+0x1fe0000)
    e1:SetLabel(c:GetAttack())
    e1:SetOperation(scard.flag_raise)
    c:RegisterEffect(e1)
    c:RegisterFlagEffect(511005018,RESET_EVENT+0x1fe0000,0,1)
  end
end

function scard.flag_op(e,tp,eg,ep,ev,re,r,rp)
  Duel.GetFieldGroup(0,LOCATION_MZONE,LOCATION_MZONE):ForEach(scard.flag_reg)
end

function scard.this_fil(c)
  return c:IsCode(511005018) and c:IsFaceup()
end

function scard.flag_raise(e,tp,eg,ep,ev,re,r,rp)
  local c=e:GetHandler()
  if e:GetLabel()==c:GetAttack() then return end
  if (not re or not re:GetOwner():IsCode(511005018)) and Duel.IsExistingMatchingCard(scard.this_fil,c:GetControler(),LOCATION_MZONE,0,1,nil) then
    Duel.RaiseEvent(Group.FromCards(c),511005018,e,REASON_EFFECT,rp,tp,e:GetLabel())
  end
  e:SetLabel(c:GetAttack())
end

function scard.cd(e,tp,eg,ep,ev,re,r,rp)
  return eg:GetFirst():IsControler(tp)
end

function scard.op(e,tp,eg,ep,ev,re,r,rp)
  local tc=eg:GetFirst()
  local val=ev-tc:GetAttack()
  if val~=0 then
    Duel.Damage(1-tp,math.abs(val),REASON_EFFECT)
    tc:ResetEffect(EFFECT_UPDATE_ATTACK,RESET_CODE)
    tc:ResetEffect(EFFECT_SET_ATTACK,RESET_CODE)
    tc:ResetEffect(EFFECT_SET_ATTACK_FINAL,RESET_CODE)
    local e1=Effect.CreateEffect(e:GetHandler())
    e1:SetType(EFFECT_TYPE_SINGLE)
    e1:SetCode(EFFECT_UPDATE_ATTACK)
    e1:SetProperty(EFFECT_FLAG_CANNOT_DISABLE)
    e1:SetReset(RESET_EVENT+0x1fe0000)
    e1:SetValue(val)
    tc:RegisterEffect(e1)
    while tc:GetAttack()~=ev do
      e1:SetValue(e1:GetValue()+ev-tc:GetAttack())
    end
  end
end