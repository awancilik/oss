Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class HOBAPDetail
		Inherits XPLiteObject
		Dim fHOBAPDetailID As Guid
		<Key(true)> _
		Public Property HOBAPDetailID() As Guid
			Get
				Return fHOBAPDetailID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("HOBAPDetailID", fHOBAPDetailID, value)
			End Set
		End Property
        Dim fHOBAPID As HOBAP
        Public Property HOBAPID() As HOBAP
            Get
                Return fHOBAPID
            End Get
            Set(ByVal value As HOBAP)
                SetPropertyValue(Of HOBAP)("HOBAPID", fHOBAPID, value)
            End Set
        End Property
        Dim fTimTeknis As HOTimTeknis
        Public Property TimTeknis() As HOTimTeknis
            Get
                Return fTimTeknis
            End Get
            Set(ByVal value As HOTimTeknis)
                SetPropertyValue(Of HOTimTeknis)("TimTeknis", fTimTeknis, value)
            End Set
        End Property
		Dim fSaran As String
		<Size(150)> _
		Public Property Saran() As String
			Get
				Return fSaran
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Saran", fSaran, value)
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
