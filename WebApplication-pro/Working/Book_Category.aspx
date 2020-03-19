<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="Book_Category.aspx.cs" Inherits="WebApplication_pro.Working.Book_Category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table class="nav-justified">
    <tr>
        <td>
            <br />
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Book Category"></asp:Label>
            <br />
            <br />
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="CategoryId" DataSourceID="SqlDataSource1" DefaultMode="Insert" Height="179px" OnItemInserted="DetailsView1_ItemInserted" Width="511px">
                <Fields>
                    <asp:BoundField DataField="CategoryId" HeaderText="Category Id" InsertVisible="False" ReadOnly="True" SortExpression="CategoryId" />
                    <asp:BoundField DataField="Name" HeaderText="Book Name" SortExpression="Name" />
                    <asp:CommandField ShowInsertButton="True" />
                </Fields>
                <InsertRowStyle ForeColor="Black" />
            </asp:DetailsView>
            <br />
            <asp:Label ID="Label2" runat="server" ForeColor="Red"></asp:Label>
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="CategoryId" DataSourceID="SqlDataSource1" GridLines="Horizontal" Height="292px" OnRowUpdated="GridView1_RowUpdated" Width="519px">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="CategoryId" HeaderText="Category Id" InsertVisible="False" ReadOnly="True" SortExpression="CategoryId" />
                    <asp:BoundField DataField="Name" HeaderText="Book Name" SortExpression="Name" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <SortedAscendingCellStyle BackColor="#F4F4FD" />
                <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                <SortedDescendingCellStyle BackColor="#D8D8F0" />
                <SortedDescendingHeaderStyle BackColor="#3E3277" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:AspProjectConnectionString %>" DeleteCommand="DELETE FROM [Book_Category] WHERE [CategoryId] = @original_CategoryId AND [Name] = @original_Name" InsertCommand="INSERT INTO [Book_Category] ([Name]) VALUES (@Name)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Book_Category]" UpdateCommand="UPDATE [Book_Category] SET [Name] = @Name WHERE [CategoryId] = @original_CategoryId AND [Name] = @original_Name">
                <DeleteParameters>
                    <asp:Parameter Name="original_CategoryId" Type="Int32" />
                    <asp:Parameter Name="original_Name" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Name" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="original_CategoryId" Type="Int32" />
                    <asp:Parameter Name="original_Name" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <br />
            <br />
        </td>
    </tr>
</table>
</asp:Content>
