return function()
  local src="duel-short"
  Extensions.Register(src,1,0,"Duel Shortcuts")
  Extensions.Require(src,"duel",1,0)

  Duel.SMC=Duel.SelectMatchingCard
  Duel.ST=Duel.SelectTarget
  Duel.WSC=Duel.WithSelectedCard
  Duel.MSMC=Duel.MaybeSelectMatchingCard
  Duel.MWSC=Duel.MaybeWithSelectedCard
  Duel.D=Duel.Damage
  Duel.DD=Duel.DiscardDeck
  Duel.GLC=Duel.GetLocationCount
  Duel.ZC=Duel.ZoneCheck
  Duel.GMG=Duel.GetMatchingGroup
  Duel.GMGC=Duel.GetMatchingGroupCount
  Duel.WMG=Duel.WithMatchingGroup
  Duel.IEMC=Duel.IsExistingMatchingCard
  Duel.IET=Duel.IsExistingTarget
  Duel.PFC=Duel.PlayerFilterCheck
  Duel.PFTC=Duel.PlayerFilterTargetCheck
  Duel.GAC=Duel.GetAttackCards
  Duel.GAG=Duel.GetAttackGroup
  Duel.TR=Duel.TempRemove
  Duel.GUT=Duel.GetUncheckedTargets
  Duel.GCT=Duel.GetCheckedTargets
  Duel.SCT=Duel.SingleCheckedTarget
  Duel.SUT=Duel.SingleUncheckedTarget
  Duel.MUT=Duel.MaybeUncheckedTarget
  Duel.MCT=Duel.MaybeCheckedTarget
  Duel.BC=Duel.BitCheck
  Duel.EGF=Duel.EnableGlobalFlag
  Duel.GL=Duel.GetLP
  Duel.SL=Duel.SetLP
  Duel.GTP=Duel.GetTurnPlayer
  Duel.GTC=Duel.GetTurnCount
  Duel.GDC=Duel.GetDrawCount
  Duel.RE=Duel.RegisterEffect
  Duel.RFE=Duel.RegisterFlagEffect
  Duel.GFE=Duel.GetFlagEffect
  Duel.RsFE=Duel.ResetFlagEffect
  Duel.Des=Duel.Destroy
  Duel.R=Duel.Remove
  Duel.STG=Duel.SendtoGrave
  Duel.STH=Duel.SendtoHand
  Duel.STD=Duel.SendtoDeck
  Duel.PSTE=Duel.PSendtoExtra
  Duel.GOG=Duel.GetOperatedGroup
  Duel.S=Duel.Summon
  Duel.SSR=Duel.SpecialSummonRule
  Duel.SyS=Duel.SynchroSummon
  Duel.XS=Duel.XyzSummon
  Duel.CT=Duel.CreateToken
  Duel.SS=Duel.SpecialSummoR
  Duel.SSS=Duel.SpecialSummonStep
  Duel.SSC=Duel.SpecialSummonComplete
  Duel.RC=Duel.RemoveCounter
  Duel.ICRC=Duel.IsCanRemoveCounter
  Duel.GC=Duel.GetCounter
  Duel.CP=Duel.ChangePosition
  Duel.Rel=Duel.Release
  Duel.MTF=Duel.MoveToField
  Duel.RTF=Duel.ReturnToField
  Duel.MS=Duel.MoveSequence
  Duel.SCL=Duel.SetChainLimit
  Duel.SCLTCE=Duel.SetChainLimitTillChainEnd
  Duel.GCM=Duel.GetChainMaterial
  Duel.CD=Duel.ConfirmDecktop
  Duel.CC=Duel.ConfirmCards
  Duel.SD=Duel.SortDecktop
  Duel.CE=Duel.CheckEvent
  Duel.REv=Duel.RaiseEvent
  Duel.RSE=Duel.RaiseSingleEvent
  Duel.ChT=Duel.CheckTiming
  Duel.GE=Duel.GetEnvironment
  Duel.IE=Duel.IsEnvironment
  Duel.W=Duel.Win
  Duel.Dr=Duel.Draw
  Duel.Rec=Duel.Recover
  Duel.E=Duel.Equip
  Duel.EC=Duel.EquipComplete
  Duel.GCt=Duel.GetControl
  Duel.SC=Duel.SwapControl
  Duel.CLC=Duel.CheckLPCost
  Duel.PLC=Duel.PayLPCost
  Duel.DH=Duel.DiscardHand
  Duel.DSC=Duel.DisableShuffleCheck
  Duel.ShD=Duel.ShuffleDeck
  Duel.SH=Duel.ShuffleHand
  Duel.ShSC=Duel.ShuffleSetCard
  Duel.CA=Duel.ChangeAttacker
  Duel.RA=Duel.ReplaceAttacker
  Duel.CAT=Duel.ChangeAttackTarget
  Duel.RAT=Duel.ReplaceAttackTarget
  Duel.Calc=Duel.CalculateDamage
  Duel.GBD=Duel.GetBattleDamage
  Duel.CBD=Duel.ChangeBattleDamage
  Duel.CTC=Duel.ChangeTargetCard
  Duel.CTP=Duel.ChangeTargetPlayer
  Duel.CTPr=Duel.ChangeTargetParam
  Duel.BE=Duel.BreakEffect
  Duel.B=Duel.BreakEffect
  Duel.CCO=Duel.ChangeChainOperation
  Duel.NA=Duel.NegateActivation
  Duel.NE=Duel.NegateEffect
  Duel.NRC=Duel.NegateRelatedChain
  Duel.NS=Duel.NegateSummon
  Duel.ISC=Duel.IncreaseSummonedCount
  Duel.CSC=Duel.CheckSummonedCount
  Duel.GFC=Duel.GetFieldCard
  Duel.CL=Duel.CheckLocation
  Duel.GCC=Duel.GetCurrentChain
  Duel.GCI=Duel.GetChainInfo
  Duel.GFT=Duel.GetFirstTarget
  Duel.GCP=Duel.GetCurrentPhase
  Duel.SP=Duel.SkipPhase
  Duel.IDC=Duel.IsDamageCalculated
  Duel.GA=Duel.GetAttacker
  Duel.GAT=Duel.GetAttackTarget
  Duel.NAt=Duel.NegateAttack
  Duel.CA=Duel.ChainAttack
  Duel.Adj=Duel.Readjust
  Duel.AI=Duel.AdjustInstantly
  Duel.GFG=Duel.GetFieldGroup
  Duel.GFGC=Duel.GetFieldGroupCount
  Duel.GDG=Duel.GetDecktopGroup
  Duel.GFMC=Duel.GetFirstMatchingCard
  Duel.GRG=Duel.GetReleaseGroup
  Duel.GRGC=Duel.GetReleaseGroupCount
  Duel.CRG=Duel.CheckReleaseGroup
  Duel.SRG=Duel.SelectReleaseGroup
  Duel.CRGX=Duel.CheckReleaseGroupEx
  Duel.SRGX=Duel.SelectReleaseGroupEx
  Duel.GTG=Duel.GetTributeGroup
  Duel.GTrC=Duel.GetTributeCount
  Duel.STr=Duel.SelectTribute
  Duel.GTgC=Duel.GetTargetCount 
  Duel.SFM=Duel.SelectFusionMaterial
  Duel.SetFM=Duel.SetFusionMaterial
  Duel.SetSM=Duel.SetSynchroMaterial
  Duel.SSM=Duel.SelectSynchroMaterial
  Duel.CSM=Duel.CheckSynchroMaterial
  Duel.STM=Duel.SelectTunerMaterial
  Duel.CTM=Duel.CheckTunerMaterial
  Duel.GRM=Duel.GetRitualMaterial
  Duel.RRM=Duel.ReleaseRitualMaterial
  Duel.STC=Duel.SetTargetCard
  Duel.CTC=Duel.ClearTargetCard
  Duel.STP=Duel.SetTargetPlayer
  Duel.STPr=Duel.SetTargetParam
  Duel.SOI=Duel.SetOperationInfo
  Duel.GOI=Duel.GetOperationInfo
  Duel.GOC=Duel.GetOperationCount
  Duel.CXM=Duel.CheckXyzMaterial
  Duel.SXM=Duel.SelectXyzMaterial
  Duel.O=Duel.Overlay
  Duel.GXG=Duel.GetOverlayGroup
  Duel.GXC=Duel.GetOverlayCount
  Duel.CROC=Duel.CheckRemoveOverlayCard
  Duel.ROC=Duel.RemoveOverlayCard
  Duel.H=Duel.Hint
  Duel.HS=Duel.HintSelection
  Duel.SEYN=Duel.SelectEffectYesNo
  Duel.SYN=Duel.SelectYesNo
  Duel.SO=Duel.SelectOption
  Duel.SelP=Duel.SelectPosition
  Duel.SDF=Duel.SelectDisableField
  Duel.AR=Duel.AnnounceRace
  Duel.AA=Duel.AnnounceAttribute
  Duel.AL=Duel.AnnounceLevel
  Duel.AC=Duel.AnnounceCard
  Duel.AT=Duel.AnnounceType
  Duel.AN=Duel.AnnounceNumber
  Duel.AF=Duel.AnnounceCoin
  Duel.TC=Duel.TossCoin
  Duel.TD=Duel.TossDice
  Duel.GCR=Duel.GetCoinResult
  Duel.GDR=Duel.GetDiceResult
  Duel.SCR=Duel.SetCoinResult
  Duel.SDR=Duel.SetDiceResult
  Duel.IPABE=Duel.IsPlayerAffectedByEffect
  Duel.IPCD=Duel.IsPlayerCanDraw
  Duel.IPCDD=Duel.IsPlayerCanDiscardDeck
  Duel.IPCDDAC=Duel.IsPlayerCanDiscardDeckAsCost
  Duel.IPCS=Duel.IsPlayerCanSummon
  Duel.IPCSS=Duel.IsPlayerCanSpecialSummon
  Duel.IPCFS=Duel.IsPlayerCanFlipSummon
  Duel.IPCSSM=Duel.IsPlayerCanSpecialSummonMonster
  Duel.IPCSSC=Duel.IsPlayerCanSpecialSummonCount
  Duel.IPCRel=Duel.IsPlayerCanRelease
  Duel.IPCR=Duel.IsPlayerCanRemove
  Duel.IPCSTH=Duel.IsPlayerCanSendtoHand
  Duel.IPCSTG=Duel.IsPlayerCanSendtoGrave
  Duel.IPCSTD=Duel.IsPlayerCanSendtoDeck
  Duel.ICN=Duel.IsChainNegatable
  Duel.ICD=Duel.IsChainDisablable
  Duel.CCT=Duel.CheckChainTarget
  Duel.CCU=Duel.CheckChainUniqueness
  Duel.GActC=Duel.GetActivityCount
  Duel.CPA=Duel.CheckPhaseActivity
  Duel.ACAC=Duel.AddCustomActivityCounter
  Duel.GCAC=Duel.GetCustomActivityCount
  Duel.IATEB=Duel.IsAbleToEnterBP
  Duel.VSC=Duel.VenomSwampCheck
  Duel.SDAG=Duel.SwapDeckAndGrave
  Duel.MC=Duel.MajesticCopy
end
