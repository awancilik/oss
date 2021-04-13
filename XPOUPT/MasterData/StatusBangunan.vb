Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class StatusBangunan
		Inherits XPLiteObject
		Dim fStatusBangunanID As Guid
		<Key(true)> _
		Public Property StatusBangunanID() As Guid
			Get
				Return fStatusBangunanID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("StatusBangunanID", fStatusBangunanID, value)
			End Set
		End Property
        Dim fStatusBangunan As String
        <Size(50)> _
        <Persistent("StatusBangunan")> _
        Public Property StatusBangunan() As String
            Get
                Return fStatusBangunan
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("StatusBangunan", fStatusBangunan, value)
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
