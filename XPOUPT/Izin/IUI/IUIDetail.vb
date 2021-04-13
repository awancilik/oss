Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class IUIDetail
		Inherits XPLiteObject
		Dim fIUIDetailID As Guid
		<Key(true)> _
		Public Property IUIDetailID() As Guid
			Get
				Return fIUIDetailID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("IUIDetailID", fIUIDetailID, value)
			End Set
        End Property

        Dim fIUIID As IUI
        <Association("IUI-IUIDetail")> _
        Public Property IUIID() As IUI
            Get
                Return fIUIID
            End Get
            Set(ByVal value As IUI)
                SetPropertyValue(Of IUI)("IUIID", fIUIID, value)
            End Set
        End Property

        Dim fKLUIID As JenisUsahaKLUI
        Public Property KLUIID() As JenisUsahaKLUI
            Get
                Return fKLUIID
            End Get
            Set(ByVal value As JenisUsahaKLUI)
                SetPropertyValue(Of JenisUsahaKLUI)("KLUIID", fKLUIID, value)
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
