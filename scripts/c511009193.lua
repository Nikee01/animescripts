--Lyrical Luscinia - Assemble Nightingale
function c511009193.initial_effect(c)
	--xyz summon
	aux.AddXyzProcedure(c,aux.FilterBoolFunction(Card.IsSetCard,0x411),1,2,nil,nil,5)
	c:EnableReviveLimit()
	--atk
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCode(EFFECT_UPDATE_ATTACK)
	e1:SetValue(c511009193.atkval)
	c:RegisterEffect(e1)
	--mutiple direct attack
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_CONTINUOUS+EFFECT_TYPE_FIELD)
	e2:SetRange(LOCATION_MZONE)
	e2:SetCode(EVENT_PRE_BATTLE_DAMAGE)
	e2:SetCondition(c511009193.rdcon)
	e2:SetOperation(c511009193.rdop)
	c:RegisterEffect(e2)
	--direct attack
	local e3=Effect.CreateEffect(c)
	e3:SetType(EFFECT_TYPE_SINGLE)
	e3:SetCode(EFFECT_DIRECT_ATTACK)
	e3:SetCondition(c511009193.dircon)
	c:RegisterEffect(e3)
	
	--destroy replace + 0 Battle damage
	local e5=Effect.CreateEffect(c)
	e5:SetType(EFFECT_TYPE_CONTINUOUS+EFFECT_TYPE_SINGLE)
	e5:SetCode(EVENT_PRE_DAMAGE_CALCULATE)
	e5:SetCondition(c511009193.damcon)
	e5:SetOperation(c511009193.damop)
	c:RegisterEffect(e5)
	--
	local e6=Effect.CreateEffect(c)
	e6:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e6:SetCode(EVENT_CHAIN_SOLVING)
	e6:SetRange(LOCATION_MZONE)
	e6:SetCondition(c511009193.damcon2)
	e6:SetOperation(c511009193.damop)
	c:RegisterEffect(e6)
end
function c511009193.atkval(e,c)
	return c:GetOverlayCount()*100
end

function c511009193.rdcon(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	return ep~=tp and c==Duel.GetAttacker() and Duel.GetAttackTarget()==nil and c:GetFlagEffect(511009193)<c:GetOverlayCount() 
end
function c511009193.rdop(e,tp,eg,ep,ev,re,r,rp)
		local c=e:GetHandler()
		c:RegisterFlagEffect(511009193,RESET_EVENT+0x1fe0000+RESET_PHASE+PHASE_END,0,1)
		local e1=Effect.CreateEffect(c)
		e1:SetType(EFFECT_TYPE_SINGLE)
		e1:SetCode(EFFECT_EXTRA_ATTACK)
		e1:SetValue(c95100914.val)
		e1:SetReset(RESET_EVENT+0x1fe0000+RESET_PHASE+PHASE_END)
		c:RegisterEffect(e1)
		local e5=Effect.CreateEffect(c)
		e5:SetType(EFFECT_TYPE_FIELD)
		e5:SetCode(EFFECT_CANNOT_BE_BATTLE_TARGET)
		e5:SetRange(LOCATION_MZONE)
		e5:SetTargetRange(0,LOCATION_MZONE)
		e5:SetProperty(EFFECT_FLAG_SET_AVAILABLE)
		e5:SetReset(RESET_EVENT+0x1fe0000+RESET_PHASE+PHASE_END)
		e5:SetCondition(c511009193.ocon1)
		e5:SetTarget(c511009193.tg)
		e5:SetValue(1)
		c:RegisterEffect(e5)
end
function c511009193.val(e,c)
	return c:GetOverlayCount()-1
end
function c511009193.ocon1(e)
	local c=e:GetHandler()
	return Duel.GetAttacker()==c
end
function c511009193.tg(e,c)
	return c:IsType(TYPE_MONSTER)
end
function c511009193.dircon(e)
	local c=e:GetHandler()
	return c:GetFlagEffect(511009193)<c:GetOverlayCount() 
end

function c511009193.reptg(e,tp,eg,ep,ev,re,r,rp,chk)
	local c=e:GetHandler()
	if chk==0 then return e:GetHandler():CheckRemoveOverlayCard(tp,1,REASON_EFFECT) end
	if Duel.SelectYesNo(tp,aux.Stringid(49678559,1)) then
		c:RemoveOverlayCard(tp,1,1,REASON_EFFECT)
		if e:GetHandler():IsReason(REASON_BATTLE) then
		local e1=Effect.CreateEffect(e:GetHandler())
		e1:SetCode(EFFECT_AVOID_BATTLE_DAMAGE)
		e1:SetReset(RESET_PHASE+PHASE_DAMAGE)
		e:GetHandler():RegisterEffect(e1)
		end
		return true
	else return false end
end 


--------------------------------------------------------
function c511009193.damcon(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local bc=c:GetBattleTarget()
	if not bc or c:GetEffectCount(EFFECT_INDESTRUCTABLE_BATTLE)>0 then return false end
	if bc==Duel.GetAttackTarget() and bc:IsDefencePos() then return false end
	if c:IsAttackPos() and bc:IsDefencePos() and bc:GetEffectCount(EFFECT_DEFENCE_ATTACK)==1 
		and c:GetAttack()<=bc:GetDefence() then return true end
	if c:IsAttackPos() and (bc:IsAttackPos() or bc:IsHasEffect(EFFECT_DEFENCE_ATTACK)) 
		and c:GetAttack()<=bc:GetAttack() then return true end
	if c:IsDefencePos() and bc:IsDefencePos() and bc:GetEffectCount(EFFECT_DEFENCE_ATTACK)==1 
		and c:GetDefence()<bc:GetDefence() then return true end
	if c:IsDefencePos() and (bc:IsAttackPos() or bc:IsHasEffect(EFFECT_DEFENCE_ATTACK)) 
		and c:GetDefence()<bc:GetAttack() then return true end
	return false
end

function c511009193.damop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	if (e:GetCode()~=EVENT_PRE_DAMAGE_CALCULATE or c:IsRelateToBattle()) and e:GetHandler():CheckRemoveOverlayCard(tp,1,REASON_EFFECT)
		and Duel.SelectYesNo(tp,aux.Stringid(23232295,1)) then
		Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_DESREPLACE)
		e:GetHandler():RemoveOverlayCard(tp,1,1,REASON_EFFECT)
		if e:GetCode()==EVENT_PRE_DAMAGE_CALCULATE then
			local e1=Effect.CreateEffect(e:GetHandler())
			e1:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
			e1:SetCode(EVENT_PRE_BATTLE_DAMAGE)
			e1:SetOperation(c511009193.damopx)
			e1:SetReset(RESET_PHASE+PHASE_DAMAGE)
			Duel.RegisterEffect(e1,tp)
			local e2=Effect.CreateEffect(c)
			e2:SetType(EFFECT_TYPE_SINGLE)
			e2:SetCode(EFFECT_INDESTRUCTABLE_BATTLE)
			e2:SetValue(1)
			e2:SetReset(RESET_PHASE+PHASE_DAMAGE)
			c:RegisterEffect(e2)
		else
			local e3=Effect.CreateEffect(c)
			e3:SetType(EFFECT_TYPE_SINGLE)
			e3:SetCode(EFFECT_INDESTRUCTABLE_EFFECT)
			e3:SetValue(1)
			e3:SetReset(RESET_CHAIN)
			c:RegisterEffect(e3)
		end
	end
end
function c511009193.damopx(e,tp,eg,ep,ev,re,r,rp)
	Duel.ChangeBattleDamage(tp,0)
end
function c511009193.damcon2(e,tp,eg,ep,ev,re,r,rp)
	local ex,tg,tc=Duel.GetOperationInfo(ev,CATEGORY_DESTROY)
	if tg==nil then return false end
	return ex and tg:IsContains(e:GetHandler()) and tc+1-tg:GetCount()==1
end

