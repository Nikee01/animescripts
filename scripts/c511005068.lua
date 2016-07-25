--Rivals Unite
--  By Shad3

local self=c511005068

function self.initial_effect(c)
  --Activate
  local e1=Effect.CreateEffect(c)
  e1:SetType(EFFECT_TYPE_ACTIVATE)
  e1:SetCode(EVENT_ATTACK_DISABLED)
  e1:SetCategory(CATEGORY_EQUIP)
  e1:SetProperty(EFFECT_FLAG_CARD_TARGET)
  e1:SetCondition(self.cd)
  e1:SetTarget(self.tg)
  e1:SetOperation(self.op)
  c:RegisterEffect(e1)
  --Destroyed
  local e2=Effect.CreateEffect(c)
  e2:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_TRIGGER_F)
  e2:SetCode(EVENT_DESTROYED)
  e2:SetCategory(CATEGORY_CONTROL)
  e2:SetCondition(self.con_cd)
  e2:SetOperation(self.con_op)
  c:RegisterEffect(e2)
end

function self.cd(e,tp,eg,ep,ev,re,r,rp)
  local ac=Duel.GetAttacker()
  local bc=Duel.GetAttackTarget()
  return bc and ac:IsLocation(LOCATION_MZONE) and bc:IsLocation(LOCATION_MZONE) and ac:IsControler(tp)
end

function self.tg(e,tp,eg,ep,ev,re,r,rp,chk)
  local bc=Duel.GetAttackTarget()
  if chk==0 then return bc and bc:IsFaceup() and bc:IsCanBeEffectTarget(e) and bc:IsControlerCanBeChanged() end
  Duel.SetTargetCard(bc)
  Duel.SetOperationInfo(0,CATEGORY_EQUIP,e:GetHandler(),1,0,0)
end

function self.op(e,tp,eg,ep,ev,re,r,rp)
  local c=e:GetHandler()
  local tc=Duel.GetFirstTarget()
  if c:IsRelateToEffect(e) and tc:IsRelateToEffect(e) then
    Duel.Equip(tp,c,tc)
    local e1=Effect.CreateEffect(c)
    e1:SetType(EFFECT_TYPE_EQUIP)
    e1:SetCode(EFFECT_SET_CONTROL)
    e1:SetValue(function(e,c) return e:GetHandlerPlayer() end)
    e1:SetReset(RESET_EVENT+0x1fe0000)
    c:RegisterEffect(e1)
    local e2=Effect.CreateEffect(c)
    e2:SetType(EFFECT_TYPE_EQUIP)
    e2:SetCode(EFFECT_CANNOT_ATTACK)
    e2:SetReset(RESET_EVENT+0x1fe0000)
    c:RegisterEffect(e2)
    local e3=Effect.CreateEffect(c)
    e3:SetType(EFFECT_TYPE_SINGLE)
    e3:SetCode(EFFECT_EQUIP_LIMIT)
    e3:SetProperty(EFFECT_FLAG_CANNOT_DISABLE)
    e3:SetValue(function(e,c) return c==e:GetLabelObject() end)
    e3:SetLabelObject(tc)
    e3:SetReset(RESET_EVENT+0x1fe0000)
    c:RegisterEffect(e3)
    local e4=Effect.CreateEffect(c)
    e4:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_TRIGGER_F)
    e4:SetCode(EVENT_DESTROYED)
    e4:SetRange(LOCATION_SZONE)
    e4:SetReset(RESET_EVENT+0x1fe0000)
    e4:SetCondition(self.des_cd)
    e4:SetOperation(self.des_op)
    c:RegisterEffect(e4)
  end
end

function self.des_cd(e,tp,eg,ep,ev,re,r,rp)
  local rc=e:GetHandler():GetEquipTarget()
  return rc and eg:IsExists(rc)
end

function self.des_op(e,tp,eg,ep,ev,re,r,rp)
  Duel.Destroy(e:GetHandler(),REASON_EFFECT)
end

function self.con_cd(e,tp,eg,ep,ev,re,r,rp)
  local rc=e:GetHandler():GetPreviousEquipTarget()
  return rc and rc:IsLocation(LOCATION_ONFIELD) and rc:IsFaceup()
end

function self.con_op(e,tp,eg,ep,ev,re,r,rp)
  local rc=e:GetHandler():GetPreviousEquipTarget()
  if not rc or not rc:IsLocation(LOCATION_ONFIELD) or rc:IsFacedown() or rc:IsImmuneToEffect(e) then return end
  rc:ResetEffect(EFFECT_SET_CONTROL,RESET_CODE)
  local e1=Effect.CreateEffect(e:GetHandler())
  e1:SetType(EFFECT_TYPE_SINGLE)
  e1:SetCode(EFFECT_SET_CONTROL)
  e1:SetValue(rc:GetOwner())
  e1:SetReset(RESET_EVENT+0xec0000)
  rc:RegisterEffect(e1)
end