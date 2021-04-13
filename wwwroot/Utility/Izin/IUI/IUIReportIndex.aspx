<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="IUIReportIndex.aspx.vb" Inherits="Utility_Izin_IUIReportIndex" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <h1>
        IUI Report Index
    </h1>
    <div class="main_menu">
        <div class="clearfix container">
            <div class="left clearfix">
                <asp:LinkButton ID="LinkButton" runat="server" PostBackUrl="~/report/parameterPage/IUI/KeputusanParameter.aspx">
                <div class="inner_left image">
                    <img alt="Cetak Keputusan IMB" src="../../../gambar/Icon/laporan.gif" style="border:none;" />
                </div>
                <div class="inner_left text">
                    <span class="header_text">Cetak Keputusan IUI</span>
                    <span class="ket_text">
                        Berfungsi untuk membuat keputusan Izin Usaha Industri<br />
                    </span>
                </div> 
                </asp:LinkButton>
            </div>
            <div class="left clearfix">
                <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/report/parameterPage/IUI/PetikanIUI.aspx">
                <div class="inner_left image">
                    <img alt="Cetak Keputusan IMB" src="../../../gambar/Icon/laporan.gif" style="border:none;" />
                </div>
                <div class="inner_left text">
                    <span class="header_text">Cetak Petikan IUI</span>
                    <span class="ket_text">
                        Berfungsi untuk membuat Petikan Izin Usaha Industri<br />
                    </span>
                </div> 
                </asp:LinkButton>
            </div>
        </div>
        <div class="clearfix container">
            <div class="left clearfix">
                <asp:LinkButton ID="PenerbitanIzinLinkButton" runat="server" PostBackUrl="~/report/parameterPage/IUI/JmlIUI.aspx">
                    <div class="inner_left image">
                        <img alt="Laporan stock Barang" src="../../../gambar/Icon/laporan.gif" style="border:none;" />
                    </div>
                    <div class="inner_left text">
                        <span class="header_text">Laporan Penerbitan IUI</span>
                        <span class="ket_text">
                            Berfungsi untuk melihat Laporan penerbitan Izin Usaha Industri<br />
                        </span>
                    </div> 
                </asp:LinkButton>
            </div>
            <%--<div class="left clearfix">
                <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/report/parameterPage/IUI/RetribusiBulananIUI.aspx">
                    <div class="inner_left image">
                        <img alt="Laporan stock Barang" src="../../../gambar/Icon/laporan.gif" style="border:none;"/>
                    </div>
                    <div class="inner_left text">
                        <span class="header_text">Laporan Retribusi IUI</span>
                        <span class="ket_text">
                            Berfungsi untuk melihat Laporan Retribusi Izin Usaha Industri<br />
                        </span>
                    </div> 
                </asp:LinkButton>
            </div>
        </div>
        <div class="clearfix container">
            <div class="left clearfix">
                <asp:LinkButton ID="LinkButton3" runat="server" PostBackUrl="~/report/parameterPage/IUI/SKRDIUI.aspx">
                    <div class="inner_left image">
                        <img alt="Laporan stock Barang" src="../../../gambar/Icon/laporan.gif" style="border:none;" />
                    </div>
                    <div class="inner_left text">
                        <span class="header_text">Laporan SKRD IUI</span>
                        <span class="ket_text">
                            Berfungsi untuk melihat Laporan SKRD Izin Usaha Industri<br />
                        </span>
                    </div> 
                </asp:LinkButton>
            </div>
        </div>--%>
    </div>
</asp:Content>
