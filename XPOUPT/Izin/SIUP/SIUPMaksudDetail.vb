Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class SIUPMaksudDetal
		Inherits XPLiteObject
		Dim fSIUPMaksudDetailID As Guid
		<Key(true)> _
		Public Property SIUPMaksudDetailID() As Guid
			Get
				Return fSIUPMaksudDetailID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("SIUPMaksudDetailID", fSIUPMaksudDetailID, value)
			End Set
		End Property
        Dim fSIUPID As SIUP
        <Association("SIUP-SIUPMaksudDetal")> _
        Public Property SIUPID() As SIUP
            Get
                Return fSIUPID
            End Get
            Set(ByVal value As SIUP)
                SetPropertyValue(Of SIUP)("SIUPID", fSIUPID, value)
            End Set
        End Property
        Dim fSIUPMaksudID As SIUPMaksud
        <Association("SIUPMaksud-SIUPMaksudDetal")> _
        Public Property SIUPMaksudID() As SIUPMaksud
            Get
                Return fSIUPMaksudID
            End Get
            Set(ByVal value As SIUPMaksud)
                SetPropertyValue(Of SIUPMaksud)("SIUPMaksudID", fSIUPMaksudID, value)
            End Set
        End Property
        
		Public Sub New(ByVal session As Session)
			MyBase.New(session)
		End Sub
		Public Sub New()
			MyBase.New(Session.DefaultSession)
		End Sub
		Public Overrides Sub AfterConstruction()
			MyBase.AfterConstruction()
		End Sub
	End Class

End Namespace
