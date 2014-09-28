unit uShtatTree;

interface

uses DB, cxTL, uShtatData, NagScreenUnit, Controls, dialogs;

const
    tnId = 0;
    tnType = 1;
    tnName = 2;
    tnKolStavok = 3;
    tnOklad = 4;
    tnSmeta = 5;
    tnDepartment = 6;
    tnMFund = 7;
    tnBonus = 8;
    tnTypePost = 9;
    tnIdShtatRasSmet = 10;
    tnShtatRas = 11;
    tnOkladFund = 12;
    tnKod = 13;
    tnIdTypePost = 14;
    tnFullOklad = 15;
    tnUsedStavok = 16;
    tnVacantions = 17;
    tnPostSalary = 18;
    tnFact = 19;
    tnDigit = 20;
    tnVacantStavokF = 21;
    tnSmetaPps = 22;
    tnKoeff = 23;
    tnMainOklad = 24;
    tnMainFullOklad = 25;
    tnBaseSmeta = 26;
    tnIsPps = 27;
    tnIsBonus = 28;
    tnIsPpsOrBonus = 29;
    tnFactDiff = 30;
    tnIdShR = 31;
    tnComment = 32;

    ntRoot = -1;
    ntSmeta = 0;
    ntDepartmentInSmeta = 1;
    ntPost = 2;
    ntDepartmentInDepartment = 3;
    ntGroupPost = 4;
    ntTypePost = 5;
    ntDepartmentInType = 6;

    stSmetDepartment = 1;
    stDepartment = 2;
    stSmetaType = 3;

type
    TShtatTree = class
    private
        DM: TdmShtatView;
        TreeList: TcxTreeList;
        NagScreen: TNagScreen;

        Id_Session: Variant;

        procedure BeginTree;
        procedure EndTree;
        procedure Clean;
        procedure AddNodes(Parent: TcxTreeListNode);
    public
        Kind: Integer;
        Actual_Date: TDate;
        UseFact: Integer;
        Id_Level: Integer;

        procedure FindStr(Text: string);
        procedure SaveBookmark(Id, Smeta_Id, Id_Type_Post, Node_Type: Variant);
        procedure GotoBookmark;
        function DebugString: string;

        procedure BuildTree;
        procedure Expand(Node: TcxTreeListNode);
        constructor Create(DM: TdmShtatView; TreeList: TcxTreeList);
        destructor Destroy; override;
    end;

implementation

uses Variants, SysUtils, Forms, uShtatUtils, ClipBrd, qFTools;

function FormInt(i: Integer; n: Integer): string;
begin
    Result := IntToStr(i);
    while Length(Result) < n do
        Result := ' ' + Result;
end;

function MatchNode(Node: TcxTreeListNode; Text: string): Boolean;
begin
    if VarIsNull(Node.Values[tnName]) then
    begin
        Result := False;
        Exit;
    end;
    Result := Pos(Text, Node.Values[tnName]) <> 0;
end;

procedure TShtatTree.FindStr(Text: string);
var
    Node: TcxTreeListNode;
begin
    Node := TreeList.TopNode;
    while Node <> nil do
    begin
        if MatchNode(Node, Text) then
        begin
            Node.Focused := True;
            Exit;
        end;

        Node := Node.GetNext;
    end;
end;

procedure TShtatTree.Clean;
begin
    if not VarIsEmpty(Id_Session) then
        with DM do
        begin
            { CleanMFundTable.Transaction.StartTransaction;
             CleanMFundTable.ParamByName('Id_Session').AsInteger := Id_Session;
             CleanMFundTable.ExecQuery;
             CleanMFundTable.Transaction.Commit;}

            ShtatViewTransaction.Rollback;
            Id_Session := Unassigned;
        end;
end;

destructor TShtatTree.Destroy;
begin
    Clean;
    inherited Destroy;
end;

procedure TShtatTree.SaveBookmark(Id, Smeta_Id, Id_Type_Post, Node_Type: Variant);
begin
    if VarIsNull(Id) then Exit;
    with DM do
    begin
        ShtatLocate.Close;
        ShtatLocate.ParamByName('Id').AsInteger := Id;
        ShtatLocate.ParamByName('F_Id_Smeta').AsVariant := Smeta_Id;
        ShtatLocate.ParamByName('F_Id_Type_Post').AsVariant := Id_Type_Post;
        ShtatLocate.ParamByName('Node_Type').AsInteger := Node_Type;
        ShtatLocate.ParamByName('Tree_Type').AsInteger := Kind;
        ShtatLocate.Open;
    end;
end;

procedure TShtatTree.GotoBookmark;
var
    i: Integer;
    Parent, Node: TcxTreeListNode;
begin
    Parent := nil;
    with DM do
    begin
        if not ShtatLocate.Active then ShtatLocate.Open;
        ShtatLocate.Last;
        while not ShtatLocate.Bof do
        begin
            if Parent = nil then
            begin
                for i := 0 to TreeList.Nodes.Count - 1 do
                    if TreeList.Nodes[i].Values[tnId] = ShtatLocate['Higher_Id'] then
                    begin
                        Parent := TreeList.Nodes[i];
                        break;
                    end
            end
            else
            begin
                Node := Parent.GetFirstChild;
                while Node <> nil do
                begin
                    if Node.Values[tnId] = ShtatLocate['Higher_Id'] then
                    begin
                        Parent := Node;
                        break;
                    end;
                    Node := Parent.GetNextChild(Node);
                end;
            end;

            if Parent <> nil then
                Parent.Expand(False);

            ShtatLocate.Prior;
        end;

        if Parent <> nil then
            Parent.Focused := True;
    end;
end;

function TShtatTree.DebugString: string;
begin
    case TreeList.FocusedNode.Values[tnType] of
        ntSmeta:
            begin
                Clipboard.AsText := IntToStr(TreeList.FocusedNode.Values[tnId]);
                Result := 'Id_Smeta: ' +
                    IntToStr(TreeList.FocusedNode.Values[tnId])
                    + ' (copied to clipboard)';
            end;
        ntDepartmentInSmeta,
            ntDepartmentInDepartment,
            ntDepartmentInType:
            begin
                Clipboard.AsText := IntToStr(TreeList.FocusedNode.Values[tnId]);
                Result := 'Id_Department: ' +
                    IntToStr(TreeList.FocusedNode.Values[tnId])
                    + ' (copied to clipboard)';
            end;
        ntPost:
            begin
                Clipboard.AsText := IntToStr(TreeList.FocusedNode.Values[tnId]);
                Result := 'Id_ShtatRas_Smet: ' +
                    IntToStr(TreeList.FocusedNode.Values[tnId])
                    + ' (copied to clipboard)';
            end;
        ntGroupPost:
            begin
                Clipboard.AsText := IntToStr(TreeList.FocusedNode.Values[tnShtatRas]);
                Result := 'Id_ShtatRas: ' +
                    IntToStr(TreeList.FocusedNode.Values[tnShtatRas])
                    + ' (copied to clipboard)';
            end;
        ntTypePost:
            begin
                Clipboard.AsText := IntToStr(TreeList.FocusedNode.Values[tnIdTypePost]);
                Result := 'Id_Type_Post: ' +
                    IntToStr(TreeList.FocusedNode.Values[tnIdTypePost])
                    + ' (copied to clipboard)';
            end;

        tnIdShR:
            begin
                Clipboard.AsText := IntToStr(TreeList.FocusedNode.Values[tnIdShR]);
                Result := 'Id_Sh_R: ' +
                    IntToStr(TreeList.FocusedNode.Values[tnIdShR])
                    + ' (copied to clipboard)';
            end;

    end;
    Result := Result +
        #13#10'Id_Session: ' + IntToStr(Id_Session) +
        #13#10' Id_Department:' +
        IntToStr(Coalesce(TreeList.FocusedNode.Values[tnDepartment], -1)) +
        #13#10' Base_Smeta:' +
        IntToStr(Coalesce(TreeList.FocusedNode.Values[tnBaseSmeta], 0)) +
        #13#10' Id_Post_Salary:' +
        IntToStr(Coalesce(TreeList.FocusedNode.Values[tnPostSalary], -1)) +
        #13#10' Id_Smeta_Pps:' +
        IntToStr(Coalesce(TreeList.FocusedNode.Values[tnSmetaPps], 0)) +
        #13#10' Koeff_Pps:' +
        FloatToStr(Coalesce(TreeList.FocusedNode.Values[tnKoeff], 0)) +
        #13#10' Id_Type_Post:' +
        IntToStr(Coalesce(TreeList.FocusedNode.Values[tnIdTypePost], 0)) +
        #13#10' Id_Sh_R:' +
        IntToStr(Coalesce(TreeList.FocusedNode.Values[tnIdShR], 0));
end;

constructor TShtatTree.Create(DM: TdmShtatView; TreeList: TcxTreeList);
begin
    inherited Create;

    Self.DM := DM;
    Self.TreeList := TreeList;
end;

function Capitalize(s: string): string;
begin
    Result := AnsiUpperCase(s[1]) + Copy(s, 2, Length(s) - 1);
end;

procedure TShtatTree.AddNodes(Parent: TcxTreeListNode);
var
    Node: TcxTreeListNode;
begin
    with DM.dsShtatTree do
    begin
        First;
        while not Eof do
        begin
            if Parent = nil then
                Node := TreeList.Add
            else Node := Parent.AddChild;

            Node.Values[tnId] := FieldValues['Id'];
            if (not (VarIsNull(FieldValues['Id_Sh_R']))) then
            begin
                // ShowMessage(VarToStr(FieldValues['Id_Sh_R']));
                Node.Values[tnIdShR] := FieldValues['Id_Sh_R'];

            end;
            if not VarIsNull(FieldValues['Smeta_Kod']) then
                Node.Values[tnName] := FormInt(FieldValues['Smeta_Kod'], 4) +
                    '. ' + FieldValues['Name']
            else Node.Values[tnName] := FieldValues['Name'];
            Node.Values[tnType] := FieldValues['Node_Type'];
            Node.Values[tnSmeta] := FieldValues['Id_Smeta'];
            Node.Values[tnDepartment] := FieldValues['Id_Department'];
            Node.Values[tnIdShtatRasSmet] := FieldValues['Id_ShtatRas_Smet'];
            Node.Values[tnIdTypePost] := FieldValues['Id_Type_Post'];
            if not VarIsNull(FieldValues['Id_Type_Post']) then
            begin
                DM.AllTypePost.Locate('Id_Type_Post', FieldValues['Id_Type_Post'], []);
                Node.Values[tnTypePost] := DM.AllTypePost['Short_Name'];
            end;
            if not VarIsNull(FieldValues['Kol_Stavok']) then
                Node.Values[tnKolStavok] :=
                    FormatFloat(DM.Consts_Query['Stavki_Disp_Format'], FieldValues['Kol_Stavok']);
            Node.Values[tnOklad] := FieldValues['Oklad'];
            Node.Values[tnFullOklad] := FieldValues['Full_Oklad'];
            Node.Values[tnMFund] := FieldValues['MFund'];
            Node.Values[tnOkladFund] := FieldValues['Oklad_Fund'];
            Node.Values[tnBonus] := FieldValues['Bonus_Fund'];
            Node.Values[tnShtatRas] := FieldValues['Id_ShtatRas'];
            Node.Values[tnKod] := FieldValues['Smeta_Kod'];
            if FieldValues['Node_Type'] = 2 then Node.HasChildren := False
            else Node.HasChildren := True;

            if ((Node.Values[tnType] = ntDepartmentInSmeta) or
                (Node.Values[tnType] = ntDepartmentInDepartment)
                or (Node.Values[tnType] = ntDepartmentInType))
                and not VarIsNull(Node.Values[tnName]) then
                Node.Values[tnName] := Capitalize(Node.Values[tnName]);

            if not VarIsNull(FieldValues['Vacantions']) then
                if abs(FieldValues['Vacantions']) >= 0.0001 then
                    Node.Values[tnVacantions] :=
                        FormatFloat(DM.Consts_Query['Stavki_Disp_Format'],
                        FieldValues['Vacantions'])
                else Node.Values[tnVacantions] := '';

            if not VarIsNull(FieldValues['Used_Stavok']) then
                if abs(FieldValues['Used_Stavok']) >= 0.0001 then
                    Node.Values[tnUsedStavok] :=
                        FormatFloat(DM.Consts_Query['Stavki_Disp_Format'],
                        FieldValues['Used_Stavok'])
                else Node.Values[tnUsedStavok] := '';

            Node.Values[tnPostSalary] := FieldValues['Id_Post_Salary'];
            Node.Values[tnFact] := FieldValues['Fact'];
            Node.Values[tnDigit] := FieldValues['Num_Digit'];
            Node.Values[tnVacantStavokF] := FieldValues['Vacantions'];
            Node.Values[tnSmetaPps] := FieldValues['Id_Smeta_Pps'];
            Node.Values[tnKoeff] := FieldValues['Koeff'];
            Node.Values[tnMainOklad] := FieldValues['Main_Oklad'];
            Node.Values[tnMainFullOklad] := FieldValues['Main_Full_Oklad'];
            Node.Values[tnBaseSmeta] := FieldValues['Base_Smeta'];
            Node.Values[tnIsPps] := FieldValues['Is_Pps'];
            Node.Values[tnIsBonus] := FieldValues['Is_Bonus'];
            Node.Values[tnIsPpsOrBonus] := FieldValues['Is_Pps_Or_Bonus'];

            if Coalesce(Node.Values[tnIsPps], 0) = 1 then
                Node.Values[tnName] := Node.Values[tnName] + ' /надб./'
            else
                if Coalesce(Node.Values[tnIsBonus], 0) = 1 then
                    Node.Values[tnIsBonus] := Node.Values[tnName] + ' /підв./'
                else
                    Node.Values[tnIsPpsOrBonus] := Node.Values[tnName] + ' /підв.+надб./';

            if VarIsNull(FieldValues['Fact_Diff']) or (FieldValues['Fact_Diff'] = 0) then
            begin
                if ((FieldValues['shtat_comment']<>'') and
                     not VarIsNull(FieldValues['shtat_comment'])) then Node.Values[tnFactDiff] := '?'
                else Node.Values[tnFactDiff] := ''
            end
            else Node.Values[tnFactDiff] := '!';
            Node.Values[tnComment]:=FieldValues['shtat_comment'];
            Next;
        end;
    end;
end;

procedure TShtatTree.Expand(Node: TcxTreeListNode);
var
    NewType: Integer;
begin
    BeginTree;
    with DM do
    begin
        dsShtatTree.Close;
        dsShtatTree.ParamByName('Id_Session').AsInteger := Id_Session;
        case Node.Values[tnType] of
            ntRoot:
                if Kind = stDepartment then NewType := ntDepartmentInDepartment
                else NewType := ntSmeta;
            ntSmeta:
                if Kind = stSmetDepartment then NewType := ntDepartmentInSmeta
                else NewType := ntTypePost;
            ntDepartmentInSmeta:
                NewType := ntDepartmentInSmeta;
            ntDepartmentInDepartment: NewType := ntDepartmentInDepartment;
            ntGroupPost: NewType := ntGroupPost;
            ntTypePost, ntDepartmentInType: NewType := ntDepartmentInType;
        end;
        dsShtatTree.ParamByName('F_Node_Type').AsInteger := NewType;
        dsShtatTree.ParamByName('F_Id_Smeta').AsVariant := Node.Values[tnSmeta];
        dsShtatTree.ParamByName('F_Id_Department').AsVariant :=
            Node.Values[tnDepartment];
        {     dsShtatTree.ParamByName('F_Id_ShtatRas').AsVariant :=
                    Node.Values[tnShtatRas];}
        dsShtatTree.ParamByName('F_Id_Post_Salary').AsVariant := Node.Values[tnPostSalary];
        dsShtatTree.ParamByName('F_Id_Type_Post').AsVariant :=
            Node.Values[tnIdTypePost];
        dsShtatTree.ParamByName('F_Koeff').AsVariant := Node.Values[tnKoeff];
        dsShtatTree.ParamByName('Actual_Date').AsDate := Actual_Date;
        dsShtatTree.Open;
    end;
    AddNodes(Node);
    EndTree;
    Node.Focused := True;
end;

procedure TShtatTree.BeginTree;
begin
    NagScreen := TNagScreen.Create(nil);
    NagScreen.Show;
    NagScreen.SetStatusText('Відкривається штатний розклад...');
    TreeList.BeginUpdate;
end;

procedure TShtatTree.EndTree;
begin
    NagScreen.Free;
    TreeList.EndUpdate;
end;

procedure TShtatTree.BuildTree;
var
    NagScreen: TNagScreen;
begin
    NagScreen := TNagScreen.Create(Application.MainForm);
    NagScreen.Show;
    NagScreen.SetStatusText('Отримується інформація з бази даних...');
    with DM do
    begin
        Clean;
        MakeMFundTable.Close;
        MakeMFundTable.ParamByName('Id_SR').AsInteger := AllSR['Id_SR'];
        MakeMFundTable.ParamByName('Actual_Date').AsDate := Actual_Date;
        MakeMFundTable.ParamByName('Fact').AsInteger := UseFact;

        if NewVersion then
            MakeMFundTable.ParamByName('NewVersion').AsInteger := 1
        else MakeMFundTable.ParamByName('NewVersion').AsInteger := 0;

        MakeMFundTable.ParamByName('Id_Level').AsInteger := Id_Level;

        MakeMFundTable.Transaction.StartTransaction;
        MakeMFundTable.Open;
        Id_Session := MakeMFundTable['Id_Session'];
        //        MakeMFundTable.Transaction.Commit; - транзакция теперь ждет до конца!
    end;
    NagScreen.Free;

    BeginTree;
    TreeList.Clear;
    with DM do
    begin
        dsShtatTree.Close;
        dsShtatTree.ParamByName('Id_Session').AsInteger := Id_Session;
        dsShtatTree.ParamByName('F_Node_Type').AsInteger := -1;
        dsShtatTree.ParamByName('F_Id_Smeta').AsVariant := Null;
        dsShtatTree.ParamByName('F_Id_Department').AsVariant := Null;
        dsShtatTree.ParamByName('F_Id_Type_Post').AsVariant := Null;
        dsShtatTree.Open;

        AddNodes(nil);
    end;
    EndTree;
    if TreeList.TopNode <> nil then
        TreeList.TopNode.Expand(False);
end;


end.
