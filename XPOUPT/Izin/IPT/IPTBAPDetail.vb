Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class IPTBAPDetail
		Inherits XPLiteObject
		Dim fIPTBAPSaranID As Guid
		<Key(true)> _
		Public Property IPTBAPSaranID() As Guid
			Get
				Return fIPTBAPSaranID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("IPTBAPSaranID", fIPTBAPSaranID, value)
			End Set
		End Property
        Dim fIPTBAPID As Guid
        Public Property IPTBAPID() As Guid
            Get
                Return fIPTBAPID
            End Get
            Set(ByVal value As Guid)
                SetPropertyValue(Of Guid)("IPTBAPID", fIPTBAPID, value)
            End Set
        End Property
		Dim fTimTeknis As String
		<Size(50)> _
		Public Property TimTeknis() As String
			Get
				Return fTimTeknis
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("TimTeknis", fTimTeknis, value)
			End Set
		End Property
		Dim fsaran As String
		<Size(255)> _
		Public Property saran() As String
			Get
				Return fsaran
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("saran", fsaran, value)
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
