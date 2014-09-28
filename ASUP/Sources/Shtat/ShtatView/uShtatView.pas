unit uShtatView;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, SpComboBox, ComCtrls, ExtCtrls, Buttons, cxGraphics,
    cxCustomData, cxStyles, cxTL, cxControls, cxInplaceContainer, cxTLData,
    cxDBTL, cxClasses, cxGridTableView, uActionControl, ActnList, uShtatViewMain,
    uFControl, uLabeledFControl, uSpravControl, uShtatData, cxFilter, cxData,
    cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomView,
    cxGridCustomTableView, cxGridDBTableView, cxGrid, cxMaskEdit,
    cxCurrencyEdit, uSearchFrame, cxTextEdit, uShtatTree, uShtatPeople,
    uDateControl, cxLabel, uBoolControl, uFormControl, AccMgmt,
    pFIBDatabase, FIBDatabase, cxHint;

type
    TfmShtatView = class(TForm)
        SRGroupBox: TGroupBox;
        ShtatKindTab: TTabControl;
        Panel1: TPanel;
        AddButton: TSpeedButton;
        ModifyButton: TSpeedButton;
        DeleteButton: TSpeedButton;
        RefreshButton: TSpeedButton;
        CancelButton: TSpeedButton;
        StyleRepository: TcxStyleRepository;
        stBackground: TcxStyle;
        stContent: TcxStyle;
        stContentEven: TcxStyle;
        stContentOdd: TcxStyle;
        stFilterBox: TcxStyle;
        stFooter: TcxStyle;
        stGroup: TcxStyle;
        stGroupByBox: TcxStyle;
        stHeader: TcxStyle;
        stInactive: TcxStyle;
        stIncSearch: TcxStyle;
        stIndicator: TcxStyle;
        stPreview: TcxStyle;
        stSelection: TcxStyle;
        stHotTrack: TcxStyle;
        qizzStyle: TcxGridTableViewStyleSheet;
        ActionControl: TqFActionControl;
        ActionList1: TActionList;
        AddAction: TAction;
        ModifyAction: TAction;
        DeleteAction: TAction;
        RefreshAction: TAction;
        QuitAction: TAction;
        SR: TqFSpravControl;
        InfoButton: TSpeedButton;
        InfoAction: TAction;
        BonusButton: TSpeedButton;
        BonusAction: TAction;
        Panel2: TPanel;
        SpeedButton1: TSpeedButton;
        CloneAction: TAction;
        ShtatTree: TcxTreeList;
        NameColumn: TcxTreeListColumn;
        KolStavokColumn: TcxTreeListColumn;
        OkladColumn: TcxTreeListColumn;
        IdColumn: TcxTreeListColumn;
        TypeColumn: TcxTreeListColumn;
        SmetaColumn: TcxTreeListColumn;
        DepartmentColumn: TcxTreeListColumn;
        MFundColumn: TcxTreeListColumn;
        BonusColumn: TcxTreeListColumn;
        Panel3: TPanel;
        Label1: TLabel;
        SearchEdit: TEdit;
        PostTypeColumn: TcxTreeListColumn;
        IdShtatRasSmetColumn: TcxTreeListColumn;
        ShtatRas: TcxTreeListColumn;
        OkladFund: TcxTreeListColumn;
        KodColumn: TcxTreeListColumn;
        IdTypePost: TcxTreeListColumn;
        FullOkladColumn: TcxTreeListColumn;
        VacantionsColumn: TcxTreeListColumn;
        PeopleButton: TSpeedButton;
        PostSalaryColumn: TcxTreeListColumn;
        UsedStavokColumn: TcxTreeListColumn;
        FactColumn: TcxTreeListColumn;
        Actual_Date: TqFDateControl;
        ActDateChangeLabel: TLabel;
        WorkersAction: TAction;
        NumDigitColumn: TcxTreeListColumn;
        VacantStavokF: TcxTreeListColumn;
        UseFact: TqFBoolControl;
        SmetaPpsColumn: TcxTreeListColumn;
        KoeffColumn: TcxTreeListColumn;
        MainOkladColumn: TcxTreeListColumn;
        MainFullOkladColumn: TcxTreeListColumn;
        BaseSmetaColumn: TcxTreeListColumn;
        Is_PpsColumn: TcxTreeListColumn;
        Is_BonusColumn: TcxTreeListColumn;
        IsPpsOrBonusColumn: TcxTreeListColumn;
        LevelPanel: TPanel;
        Level: TqFSpravControl;
        FactDiffColumn: TcxTreeListColumn;
        Id_SH_R: TcxTreeListColumn;
    ShtatHintController: TcxHintStyleController;
    SHTAT_COMMENT: TcxTreeListColumn;
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure QuitActionExecute(Sender: TObject);
        procedure FormDestroy(Sender: TObject);
        procedure FormShow(Sender: TObject);
        procedure FormResize(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure ActionControlBeforePrepare(Sender: TObject; Form: TForm);
        procedure ActionControlRefresh(Sender: TObject);
        procedure ShtatTreeCustomDrawCell(Sender: TObject; ACanvas: TcxCanvas;
            AViewInfo: TcxTreeListEditCellViewInfo; var ADone: Boolean);
        procedure ShtatKindTabChange(Sender: TObject);
        procedure FormActivate(Sender: TObject);
        procedure ShtatTreeKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure BonusActionExecute(Sender: TObject);
        procedure ShtatTreeExpanding(Sender: TObject; ANode: TcxTreeListNode;
            var Allow: Boolean);
        procedure ActionControlGetKeys(Sender: TObject;
            var ValueString: Variant);
        procedure SearchEditChange(Sender: TObject);
        procedure ShtatTreeKeyPress(Sender: TObject; var Key: Char);
        procedure ActionControlAfterDelete(Sender: TObject);
        procedure SROpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure VacanciesCalcButtonClick(Sender: TObject);
        procedure SRChange(Sender: TObject);
        procedure Actual_DateChange(Sender: TObject);
        procedure WorkersActionExecute(Sender: TObject);
        procedure UseFactChange(Sender: TObject);
        procedure ActionControlCanEdit(Sender: TObject; Mode: TFormMode;
            var CanPrepare: Boolean);
        procedure LevelOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure LevelChange(Sender: TObject);
        procedure ActionControlAfterRefresh(Sender: TObject; Value: Variant);
        procedure ActionControlBeforeDelete(Sender: TObject; Form: TForm;
            Mode: TFormMode; Transaction: TFIBTransaction);
    procedure ShtatTreeClick(Sender: TObject);
    private
        Sprav: TShtatView;
        Tree: TShtatTree;
    public
        DMModule: TdmShtatView;
        constructor Create(AOwner: TComponent; sprav: TShtatView); reintroduce;
        procedure SaveToRegistry;
    end;

var
    fmShtatView: TfmShtatView;

implementation

{$R *.dfm}

uses uShtatAdd, uShtatBonus, qFTools, Registry, NagScreenUnit, uSelectForm,
    UpKernelUnit;

constructor TfmShtatView.Create(AOwner: TComponent; sprav: TShtatView);
begin
    inherited Create(AOwner);
    Self.Sprav := sprav;

    Actual_Date.Value := Date;
    TcxCurrencyEditProperties(KolStavokColumn.Properties).DisplayFormat :=
        sprav.Data.Consts_Query['Stavki_Disp_Format'];
end;

procedure TfmShtatView.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then
        Action := caFree;
end;

procedure TfmShtatView.QuitActionExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmShtatView.FormDestroy(Sender: TObject);
begin
    {reg := TRegistry.Create;
    reg.RootKey := HKEY_CURRENT_USER;
    if reg.OpenKey('\Software\DONNU\Shtat\', True) then
    try
        reg.WriteInteger('ID_SR', Coalesce(SR.Value, -1));
        reg.WriteInteger('Tree_Kind', Tree.Kind);
        reg.WriteInteger('Level', Coalesce(Level.Value, -1));
        reg.WriteString('LevelName', Level.DisplayText);
        reg.CloseKey;
    except
    end;
    reg.Free;  }


    Tree.Free;
    if FormStyle = fsMDIChild then
        Sprav.Free;
end;

procedure TfmShtatView.SaveToRegistry;
var
    reg: TRegistry;
begin
   reg := TRegistry.Create;
   reg.RootKey := HKEY_CURRENT_USER;
   if reg.OpenKey('\Software\DONNU\Shtat\', True) then
   try
     reg.WriteInteger('ID_SR', Coalesce(SR.Value, -1));
     reg.WriteInteger('Tree_Kind', Tree.Kind);
     reg.WriteInteger('Level', Coalesce(Level.Value, -1));
     reg.WriteString('LevelName', Level.DisplayText);
     reg.CloseKey;
   except
   end;
   reg.Free;
end;

procedure TfmShtatView.FormShow(Sender: TObject);
begin
    CancelButton.Align := alRight;
end;

procedure TfmShtatView.FormResize(Sender: TObject);
begin
    SR.Width := SRGroupBox.ClientWidth - 10;
    SR.Repaint;
end;

procedure TfmShtatView.FormCreate(Sender: TObject);
var
    reg: TRegistry;
    Kind: Integer;
begin
    reg := TRegistry.Create;
    reg.RootKey := HKEY_CURRENT_USER;
    if reg.OpenKey('\Software\DONNU\Shtat\', False) then
    begin
        if VarIsNull(Sprav.Input['Id_SR']) or VarIsEmpty(Sprav.Input['Id_SR']) then
        try
            SR.Value := reg.ReadInteger('ID_SR');
        except
        end
        else
            SR.Value := Coalesce(Sprav.Input['Id_SR'], 1199);

        try
            Kind := reg.ReadInteger('Tree_Kind');
        except
            Kind := stDepartment;
        end;

        try
            Level.Value := reg.ReadInteger('Level');
            Level.DisplayText := reg.ReadString('LevelName');
        except
            Sprav.Data.LevelsSelect.Close;
            Sprav.Data.LevelsSelect.Open;
            Sprav.Data.LevelsSelect.First;
            if not Sprav.Data.LevelsSelect.IsEmpty then
            begin
                Level.Value := Sprav.Data.LevelsSelect['Id_Level'];
                Level.DisplayText := IntToStr(Sprav.Data.LevelsSelect['Level_Order']) +
                    '. ' + Sprav.Data.LevelsSelect['Level_Name'];
            end;
        end;

        reg.CloseKey;
    end
    else
    begin
        SR.Value := Coalesce(Sprav.Input['Id_SR'], 1199);

        Sprav.Data.LevelsSelect.Close;
        Sprav.Data.LevelsSelect.Open;
        Sprav.Data.LevelsSelect.First;

        if not Sprav.Data.LevelsSelect.IsEmpty then
        begin
            Level.Value := Sprav.Data.LevelsSelect['Id_Level'];
            Level.DisplayText := IntToStr(Sprav.Data.LevelsSelect['Level_Order']) +
                '. ' + Sprav.Data.LevelsSelect['Level_Name'];
        end;
    end;
    reg.Free;

    Sprav.Data.AllSR.Close;
    Sprav.Data.AllSR.Open;
    with Sprav.Data do
        if not AllSR.Locate('Id_SR', SR.Value, []) then
        begin
            AllSR.Last;
            if not AllSR.IsEmpty then
                SR.Value := AllSR['Id_SR'];
        end;

    with Sprav.Data do
        if not AllSR.IsEmpty then
        begin
            SR.DisplayText := Sprav.Data.AllSR['Name'];
            Sprav.Data.SR_Date_Beg := Sprav.Data.AllSR['Date_Beg'];
            Sprav.Data.SR_Date_End := Sprav.Data.AllSR['Date_End'];
            ActionControl.AddKeys := IntToStr(SR.Value);
        end;

    ActionControl.Database := Sprav.Data.DB;
    Actual_Date.Value := Date;

    Tree := TShtatTree.Create(Sprav.Data, ShtatTree);
    If Kind=0 Then Kind:=stSmetDepartment;
    Tree.Kind := Kind;
    if not VarIsNull(Level.Value) then
        Tree.Id_Level := Level.Value
    else
    begin
        Sprav.Data.LevelsSelect.Close;
        Sprav.Data.LevelsSelect.Open;
        Sprav.Data.LevelsSelect.First;
        if not Sprav.Data.LevelsSelect.IsEmpty then
            Tree.Id_Level := Sprav.Data.LevelsSelect['Id_Level'];
    end;

    if Kind = stSmetDepartment then
        ShtatKindTab.TabIndex := 0;
    if Kind = stDepartment then
        ShtatKindTab.TabIndex := 1;
    if Kind = stSmetaType then
        ShtatKindTab.TabIndex := 2;

    if Sprav.Data.NewVersion and UseFact.Value then
        LevelPanel.Visible := True
    else
        LevelPanel.Visible := False;
    SaveToRegistry;    
end;

procedure TfmShtatView.ActionControlBeforePrepare(Sender: TObject;
    Form: TForm);
begin
    if Form is TfmShtatAdd then
        with Form as TfmShtatAdd do
        begin
            DM := Sprav.Data;
            Kol_Stavok.Format := DM.Consts_Query['Stavki_Disp_Format'];
            DateBeg.Value := Date;
            if ShtatTree.FocusedNode <> nil then
            begin
                Id_Department := ShtatTree.FocusedNode.Values[tnDepartment];
                Id_Smeta := ShtatTree.FocusedNode.Values[tnSmeta];
            end;
        end;
end;

procedure TfmShtatView.ActionControlRefresh(Sender: TObject);
var
    Id, Smeta_Id, Id_Type_Post, Node_Type: Variant;
    Locate: Boolean;
begin
    if UseFact.Value then
        Tree.UseFact := 1
    else
        Tree.UseFact := 0;

    if Sprav.Data.LastActionIsAdd then
    begin
        Sprav.Data.LastActionIsAdd := False;

        Id := Sprav.Data.Last_ShtatRas_Smet;
        Smeta_Id := Sprav.Data.Last_Smeta;
        Node_Type := ntPost;
        Id_Type_Post := Sprav.Data.Last_TypePost;
        Locate := True;
    end
    else
        if ShtatTree.FocusedNode <> nil then
        begin
            Id := ShtatTree.FocusedNode.Values[tnId];
            Smeta_Id := ShtatTree.FocusedNode.Values[tnSmeta];
            Node_Type := ShtatTree.FocusedNode.Values[tnType];
            Id_Type_Post := ShtatTree.FocusedNode.Values[tnIdTypePost];

            Locate := True;
        end
        else
            Locate := False;

    if Locate then
        Tree.SaveBookmark(Id, Smeta_Id, Id_Type_Post, Node_Type);
    ActDateChangeLabel.Visible := False;
    Tree.Actual_Date := Actual_Date.Value;
    Tree.BuildTree;
    Tree.GotoBookmark;
end;

procedure TfmShtatView.ShtatTreeCustomDrawCell(Sender: TObject;
    ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
    var ADone: Boolean);
begin
    if AViewInfo.Selected then
    begin
        ACanvas.Brush.Color := clBlue;
        ACanvas.Font.Color := clWhite
    end
    else
        if AViewInfo.Node.Values[tnFactDiff] <> '' then
            ACanvas.Brush.Color := $F7C0C0
        else
            if AViewInfo.Node.Values[tnFact] = 1 then
                ACanvas.Brush.Color := $9090E0
            else
                case AViewInfo.Node.Values[tnType] of
                    ntSmeta:
                        if VarIsNull(AViewInfo.Node.Values[tnDepartment]) then
                            ACanvas.Brush.Color := clMoneyGreen
                        else
                            ACanvas.Brush.Color := clSkyBlue;
                    ntDepartmentInDepartment, ntDepartmentInSmeta, ntDepartmentInType:
                        ACanvas.Brush.Color := clSkyBlue;
                    ntTypePost, ntGroupPost:
                        ACanvas.Brush.Color := clWhite;
                else
                    if not VarIsNull(AViewInfo.Node.Values[tnVacantStavokF])
                        and (AViewInfo.Node.Values[tnVacantStavokF] > 0) then
                        ACanvas.Brush.Color := RGB(254, 232, 199)
                    else
                        if not VarIsNull(AViewInfo.Node.Values[tnVacantStavokF])
                            and (AViewInfo.Node.Values[tnVacantStavokF] < 0) then
                            ACanvas.Brush.Color := $A0A0FF
                        else
                            if VarIsNull(AViewInfo.Node.Values[tnOkladFund]) or
                                (AViewInfo.Node.Values[tnOkladFund] = 0) then
                                ACanvas.Brush.Color := RGB(247, 247, 234)
                            else
                                ACanvas.Brush.Color := ShtatTree.Styles.Content.Color;
                end;
end;

procedure TfmShtatView.ShtatKindTabChange(Sender: TObject);
begin
    with Sprav.Data do
    begin
        if ShtatKindTab.TabIndex = 0 then
            Tree.Kind := stSmetDepartment
        else
            if ShtatKindTab.TabIndex = 1 then
                Tree.Kind := stDepartment
            else
                if ShtatKindTab.TabIndex = 2 then
                    Tree.Kind := stSmetaType
                else
                begin
                    qFErrorDialog('Цей тип перегляду ще не зроблено!');
                    ShtatKindTab.TabIndex := 1;
                    Exit;
                end;
        RefreshAction.Execute;
        SaveToRegistry;
    end;
end;

procedure TfmShtatView.FormActivate(Sender: TObject);
begin
    ShtatTree.SetFocus;
end;

procedure TfmShtatView.ShtatTreeKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = VK_HOME then
        ShtatTree.TopNode.Focused := True;
    if Key = VK_BACK then
        SearchEdit.Text := '';
    if Key = VK_RIGHT then
        ShtatTree.FocusedNode.Expand(False);
    if Key = VK_LEFT then
        ShtatTree.FocusedNode.Collapse(True);

    if (ord(Key) = ord('Z')) and (ssAlt in Shift) and (ssShift in Shift)
        and (ssCtrl in Shift) then
    try
        ShowMessage(Tree.DebugString);
    except
    end;
end;

procedure TfmShtatView.BonusActionExecute(Sender: TObject);
var
    form: TfmShtatBonus;
begin
    if (ShtatTree.FocusedNode.Values[tnType] <> ntPost) then
    begin
        qFErrorDialog('Потрібно стати на позицію штатного розкладу!');
        Exit;
    end;

    form := TfmShtatBonus.Create(Self, Sprav.Data,
        ShtatTree.FocusedNode.Values[tnIdShtatRasSmet]);
    form.ShowModal;
    if form.DoRefresh then
        RefreshAction.Execute;
    form.Free;
end;


procedure TfmShtatView.ShtatTreeExpanding(Sender: TObject;
    ANode: TcxTreeListNode; var Allow: Boolean);
begin
    if ANode.GetFirstChild = nil then
        Tree.Expand(ANode);
end;

procedure TfmShtatView.ActionControlGetKeys(Sender: TObject;
    var ValueString: Variant);
begin
    if ShtatTree.FocusedNode.Values[tnType] <> ntPost then
        ValueString := Null
    else
        ValueString := Integer(ShtatTree.FocusedNode.Values[tnId]);
end;

procedure TfmShtatView.SearchEditChange(Sender: TObject);
begin
    Tree.FindStr(SearchEdit.Text);
end;

procedure TfmShtatView.ShtatTreeKeyPress(Sender: TObject; var Key: Char);
begin
    if Ord(Key) > 31 then
        SearchEdit.Text := SearchEdit.Text + Key;
end;

procedure TfmShtatView.ActionControlAfterDelete(Sender: TObject);
var
    Node, Parent: TcxTreeListNode;
    Id_ShtatRas_Smet: Variant;
begin
    if ShtatTree.FocusedNode <> nil then
    begin
        Id_ShtatRas_Smet := ShtatTree.FocusedNode.Values[tnIdShtatRasSmet];
        Node := ShtatTree.FocusedNode.GetPrev;

        while (Node <> nil) and
            (Node.Values[tnIdShtatRasSmet] = Id_ShtatRas_Smet) do
            Node := Node.GetPrev;

        if Node <> nil then
            Node.Focused := True;
    end;
end;

procedure TfmShtatView.SROpenSprav(Sender: TObject; var Value: Variant;
    var DisplayText: string);
var
    Last_Vacancies_Calc_Date: Variant;
begin
    Sprav.Data.GetShtatDoc(Value, DisplayText, Last_Vacancies_Calc_Date);

    if not (VarIsNull(SR.Value) or VarIsEmpty(SR.Value)) then
    begin
        ActionControl.AddKeys := IntToStr(SR.Value);
        RefreshAction.Execute;
    end;
end;

procedure TfmShtatView.VacanciesCalcButtonClick(Sender: TObject);
var
    Nag: TNagScreen;
begin
    if not qFConfirm('Ви справді бажаєте перерахувати вакансії на поточну дату?')
        then
        Exit;

    Sprav.Data.CalcVacancies.ParamByName('ID_SR').AsInteger := SR.Value;
    Sprav.Data.CalcVacancies.ParamByName('Act_Date').AsDate := Date;

    Nag := TNagScreen.Create(Self);
    Nag.Show;
    Nag.SetStatusText('Відбувається перерахунок вакансій...');
    Sprav.Data.CalcVacancies.Transaction.StartTransaction;
    Sprav.Data.CalcVacancies.ExecQuery;
    Sprav.Data.CalcVacancies.Transaction.Commit;
    Nag.Free;

    if not Sprav.Data.AllSR.Active then
        Sprav.Data.AllSR.Open;

    if Sprav.Data.AllSR.Locate('Id_SR', SR.Value, []) then

        RefreshAction.Execute;
end;

procedure TfmShtatView.SRChange(Sender: TObject);
var
    reg: TRegistry;
begin
    if Sprav.Data.AllSR.Locate('Id_SR', SR.Value, []) then
end;

procedure TfmShtatView.Actual_DateChange(Sender: TObject);
begin
    if (Tree <> nil) and (Actual_Date.Value <> Tree.Actual_Date) then
    begin
        ActDateChangeLabel.Caption := 'Щоб побачити зміни, треба оновити дані';
        ActDateChangeLabel.Visible := True;
    end;
end;

procedure TfmShtatView.WorkersActionExecute(Sender: TObject);
var
    form: TfmShtatPeople;
begin
    if ShtatTree.FocusedNode <> nil then
    begin
        form := TfmShtatPeople.Create(Self, Sprav.Data,
            ShtatTree.FocusedNode.Values[tnDepartment],
            ShtatTree.FocusedNode.Values[tnBaseSmeta],
            ShtatTree.FocusedNode.Values[tnPostSalary],
            Actual_Date.Value,
            ShtatTree.FocusedNode.Values[tnKolStavok],
            ShtatTree.FocusedNode.Values[tnVacantions],
            ShtatTree.FocusedNode.Values[tnSmetaPps],
            ShtatTree.FocusedNode.Values[tnKoeff],
            ShtatTree.FocusedNode.Values[tnIdTypePost],
            Level.Value, Sr.Value);
        form.ShowModal;
        form.Free;
    end;
end;

procedure TfmShtatView.UseFactChange(Sender: TObject);
begin
    ActDateChangeLabel.Caption := 'Щоб побачити зміни, треба оновити дані';
    ActDateChangeLabel.Visible := True;

    if Sprav.Data.NewVersion then
        LevelPanel.Visible := True;
end;

procedure TfmShtatView.ActionControlCanEdit(Sender: TObject;
    Mode: TFormMode; var CanPrepare: Boolean);
begin
    if Mode <> fmInfo then
        CanPrepare := fibCheckPermission('/ROOT/Plan_Shtat_Ras', 'Edit') = 0;
    if not CanPrepare then
        qFErrorDialog('У вас немає прав на редагування штатного розкладу!');
end;

procedure TfmShtatView.LevelOpenSprav(Sender: TObject; var Value: Variant;
    var DisplayText: string);
begin
    if qSelect(Sprav.Data.LevelsSelect) then
        with Sprav.Data do
        begin
            Value := LevelsSelect['Id_Level'];
            DisplayText := IntToStr(LevelsSelect['Level_Order']) + '. ' +
                LevelsSelect['Level_Name'];
        end;
end;

procedure TfmShtatView.LevelChange(Sender: TObject);
begin
    ActDateChangeLabel.Caption := 'Щоб побачити зміни, треба оновити дані';
    ActDateChangeLabel.Visible := True;
    if Tree <> nil then Tree.Id_Level := Level.Value;
end;

procedure TfmShtatView.ActionControlAfterRefresh(Sender: TObject;
    Value: Variant);
var
    reg: TRegistry;
begin
    reg := TRegistry.Create;
    reg.RootKey := HKEY_CURRENT_USER;
    if not reg.OpenKey('\Software\DONNU\Shtat\', False) then
    begin
        try
            reg.CreateKey('\Software\DONNU\Shtat\');
        except
        end;
    end;


    try
        reg.WriteInteger('Level', Level.Value);
        reg.WriteString('LevelName', Level.DisplayText);
        reg.CloseKey;
    except
    end;
    reg.Free;
end;

procedure TfmShtatView.ActionControlBeforeDelete(Sender: TObject;
    Form: TForm; Mode: TFormMode; Transaction: TFIBTransaction);
begin
    UpKernelUnit.StartHistory(TpFIBTransaction(Transaction));
end;

procedure TfmShtatView.ShtatTreeClick(Sender: TObject);
var PosY:integer;
begin
   PosY:=ShtatTree.Top+ShtatTree.MouseDownPos.Y+100;
   ShtatHintController.HideHint;
   if ((Not VarIsNull(Id_SH_R.Value)) And (Id_SH_R.Value<>'')) then
   begin
      If ((Not VarIsNull(SHTAT_COMMENT.Value)) And (SHTAT_COMMENT.Value<>'')) then 
      ShtatHintController.ShowHint(ShtatTree.MouseDownPos.X, PosY, '', SHTAT_COMMENT.Value);
   end;
end;

end.
