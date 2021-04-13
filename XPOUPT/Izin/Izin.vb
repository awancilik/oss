Imports System
Imports DevExpress.Xpo

Namespace OSS

	Public Class Izin
        Inherits XPLiteObject

        <Association("PermohonanDetail-Izin")> _
        Public ReadOnly Property PermohonanDetail_Izin() As XPCollection(Of PermohonanDetail)
            Get
                Return GetCollection(Of PermohonanDetail)("PermohonanDetail_Izin")
            End Get
        End Property

		Dim fIzinID As Guid
        <Key(True)> _
        Public Property IzinID() As Guid
            Get
                Return fIzinID
            End Get
            Set(ByVal value As Guid)
                SetPropertyValue(Of Guid)("IzinID", fIzinID, value)
            End Set
        End Property

		Dim fIzinNama As String
		<Size(50)> _
		Public Property IzinNama() As String
			Get
				Return fIzinNama
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("IzinNama", fIzinNama, value)
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
