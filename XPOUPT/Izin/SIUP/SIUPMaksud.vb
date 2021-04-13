Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class SIUPMaksud
		Inherits XPLiteObject
		Dim fSIUPMaksudID As Guid
		<Key(true)> _
		Public Property SIUPMaksudID() As Guid
			Get
				Return fSIUPMaksudID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("SIUPMaksudID", fSIUPMaksudID, value)
			End Set
		End Property
		Dim fMaksud As String
		<Size(50)> _
		Public Property Maksud() As String
			Get
				Return fMaksud
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Maksud", fMaksud, value)
			End Set
        End Property
        <Association("SIUPMaksud-SIUPMaksudDetal")> _
              Public ReadOnly Property SIUPMaksudDetal() As XPCollection(Of SIUPMaksudDetal)
            Get
                Return GetCollection(Of SIUPMaksudDetal)("SIUPMaksudDetal")
            End Get
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
