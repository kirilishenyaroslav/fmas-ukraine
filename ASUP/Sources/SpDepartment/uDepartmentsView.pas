{*******************************************************************************
* uDepartmentsView                                                             *
*                                                                              *
* Главная форма справочника подразделений                                      *
* Copyright ©  2002-2005, Олег Г. Волков, Донецкий Национальный Университет    *
*******************************************************************************}

unit uDepartmentsView;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, uDepartmentsTree, Buttons, ExtCtrls, uDepartmentsData, Grids,
    DBGrids, RxMemDS, ActnList, uActionControl, cxInplaceContainer, cxTL,
    cxDBTL, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, cxEdit, DB, cxDBData, StdCtrls, cxGridLevel, cxClasses,
    cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
    cxGridDBTableView, cxGrid, cxSplitter, ACCMGMT, uFormControl, uFControl,
    uLabeledFControl, uSpravControl, frxExportPDF, frxExportRTF,
    frxExportHTML, frxExportTXT, frxClass, frxExportXLS, uDateControl,
    uBoolControl, Menus, dxBar, dxBarExtItems, ImgList, frxVariables;

type
    TfmDepartmentsView = class(TForm)
        DepartmentsTree: TfmDepartmentsTree;
        ActionControl: TqFActionControl;
        ActionList1: TActionList;
        AddAction: TAction;
        ModifyAction: TAction;
        InfoAction: TAction;
        DeleteAction: TAction;
        RefreshAction: TAction;
        SelectAction: TAction;
        QuitAction: TAction;
        PropPanel: TPanel;
        cxSplitter1: TcxSplitter;
        AddPropPanel: TPanel;
        Label1: TLabel;
        BitBtn1: TBitBtn;
        BitBtn2: TBitBtn;
        cxGrid1: TcxGrid;
        PropTableView: TcxGridDBTableView;
        cxGrid1Level1: TcxGridLevel;
        AddPropAction: TAction;
        FilterPanel: TPanel;
        Id_Property: TqFSpravControl;
        frxXLSExport2: TfrxXLSExport;
        frxTXTExport1: TfrxTXTExport;
        frxHTMLExport1: TfrxHTMLExport;
        frxRTFExport1: TfrxRTFExport;
        frxPDFExport1: TfrxPDFExport;
        frxXLSExport1: TfrxXLSExport;
        ShowDeleted: TqFBoolControl;
        ActDate: TqFDateControl;
        dxBarManager1: TdxBarManager;
        MenuPanel: TPanel;
        dxBarDockControl1: TdxBarDockControl;
        AddButton: TdxBarLargeButton;
        SpDep: TImageList;
        ModifyButton: TdxBarLargeButton;
        InfoButton: TdxBarLargeButton;
        DeleteButton: TdxBarLargeButton;
        RestoreButton: TdxBarLargeButton;
        MoveButton: TdxBarLargeButton;
        RefreshButton: TdxBarLargeButton;
        UpButton: TdxBarLargeButton;
        DownButton: TdxBarLargeButton;
        PrintButton: TdxBarLargeButton;
        CancelButton: TdxBarLargeButton;
        SelectButton: TdxBarLargeButton;
        dxBarPopupMenu1: TdxBarPopupMenu;
        dxBarLargeButton1: TdxBarLargeButton;
        dxBarLargeButton2: TdxBarLargeButton;
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure CancelButtonClick(Sender: TObject);
        procedure DepartmentsTreeTreeListDblClick(Sender: TObject);
        procedure FormActivate(Sender: TObject);
        procedure DepartmentsTreeTreeListKeyPress(Sender: TObject;
            var Key: Char);
        procedure QuitActionExecute(Sender: TObject);
        procedure SelectActionExecute(Sender: TObject);
        procedure ActionControlBeforePrepare(Sender: TObject; Form: TForm);
        procedure ExitActionExecute(Sender: TObject);
        procedure PrintButtonClick(Sender: TObject);
        procedure BitBtn1Click(Sender: TObject);
        procedure AddPropActionExecute(Sender: TObject);
        procedure ActionControlCanEdit(Sender: TObject; Mode: TFormMode;
            var CanPrepare: Boolean);
        procedure ActionControlCanDelete(Sender: TObject; Mode: TFormMode;
            var CanPrepare: Boolean);
        procedure Id_PropertyOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure Id_PropertyChange(Sender: TObject);
        procedure PrintButtonMouseUp(Sender: TObject; Button: TMouseButton;
            Shift: TShiftState; X, Y: Integer);
        procedure UpButtonClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure ActionControlRefresh(Sender: TObject);
        procedure DepartmentsTreeTreeListCustomDrawCell(Sender: TObject;
            ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
            var ADone: Boolean);
        procedure ShowDeletedChange(Sender: TObject);
        procedure RestoreButtonClick(Sender: TObject);
        procedure MoveButtonClick(Sender: TObject);
        procedure RefreshActionExecute(Sender: TObject);
        procedure dxRestoreButtonClick(Sender: TObject);
        procedure dxMoveButtonClick(Sender: TObject);
        procedure dxUpButtonClick(Sender: TObject);
        procedure DownButtonClick(Sender: TObject);
        procedure dxPrintButtonClick(Sender: TObject);
        procedure dxBarLargeButton2Click(Sender: TObject);
    private
        DataModule: TdmDepartments;
        freeDM: Boolean;
        Input, Output: TRxMemoryData;
        Dsgn: Boolean;
    public
        procedure Reopen;
        constructor Create(AOwner: TComponent; DataModule: TdmDepartments;
            AllowEdit: Boolean = True; FreeDataModule: Boolean = True;
            Input: TRxMemoryData = nil; Output: TRxMemoryData = nil); reintroduce;
    end;

implementation

uses uDepartmentsAdd, uAddDepProp, qFTools, uSelectForm, uCommonSp,
    FIBQuery, pFIBQuery, uPrintReport;//, DepartmentsPrint;

{$R *.dfm}

constructor TfmDepartmentsView.Create(AOwner: TComponent;
    DataModule: TdmDepartments; AllowEdit: Boolean = True;
    FreeDataModule: Boolean = True; Input: TRxMemoryData = nil;
    Output: TRxMemoryData = nil);
begin
    inherited Create(AOwner);
    Self.DataModule := DataModule;
    Self.freeDM := FreeDataModule;
    Self.Input := Input;
    Self.Output := Output;

    if Input <> nil then
    begin
        FilterPanel.Visible := Input['Show_Properties'];
        PropPanel.Visible := Input['Show_Properties'];
        if (Input['Select'] <> 0)
            then SelectButton.Visible := ivAlways
        else SelectButton.Visible := ivNever;

        if Input['Select'] = 2 then
            DepartmentsTree.TreeList.OptionsSelection.MultiSelect := True;

        if Input['Id_Property'] <> -1 then
        begin
            if not DataModule.SpDepProp.Active then
                DataModule.SpDepProp.Open;

            Id_Property.Value := Input['Id_Property'];
            if DataModule.SpDepProp.Locate('Id_Property', Input['Id_Property'], [])
                then Id_Property.DisplayText := DataModule.SpDepProp['Name_Property'];
        end;
    end;

    if AllowEdit then
    begin
        AddButton.Visible := ivAlways;
        ModifyButton.Visible := ivAlways;
        DeleteButton.Visible := ivAlways;
        UpButton.Visible := ivAlways;
        DownButton.Visible := ivAlways;
    end
    else
    begin
        AddButton.Visible := ivNever;
        ModifyButton.Visible := ivNever;
        DeleteButton.Visible := ivNever;
        UpButton.Visible := ivNever;
        DownButton.Visible := ivNever;
    end;

    AddButton.Align := iaLeft;
    ModifyButton.Align := iaLeft;
    InfoButton.Align := iaLeft;

    //    DeleteButton.Align := alLeft;
    //    RefreshButton.Align := alLeft;

    CancelButton.Align := iaRight;
    SelectButton.Align := iaRight;

    DepartmentsTree.Prepare(DataModule.SelectDepartments);
    ActionControl.SelectDataSet := DataModule.SelectDepartments;

    PropTableView.DataController.DataSource := DataModule.DepPropDataSource;
    PropTableView.DataController.CreateAllItems;
end;

procedure TfmDepartmentsView.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    if freeDM then DataModule.Free;
    if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TfmDepartmentsView.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TfmDepartmentsView.DepartmentsTreeTreeListDblClick(
    Sender: TObject);
begin
    if not DepartmentsTree.TreeList.OptionsSelection.MultiSelect
        and (SelectButton.Visible = ivAlways) then SelectButton.Click;
end;

procedure TfmDepartmentsView.FormActivate(Sender: TObject);
begin
    if DepartmentsTree.TreeList.TopVisibleNode <> nil then
        DepartmentsTree.TreeList.TopVisibleNode.Expand(False);
end;

procedure TfmDepartmentsView.DepartmentsTreeTreeListKeyPress(
    Sender: TObject; var Key: Char);
begin
    DepartmentsTree.TreeListKeyPress(Sender, Key);

end;

procedure TfmDepartmentsView.QuitActionExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmDepartmentsView.SelectActionExecute(Sender: TObject);
var
    i: Integer;
begin
    if Output <> nil then
    begin
        Output.Open;

        with DepartmentsTree.TreeList do
            for i := 0 to SelectionCount - 1 do
            begin
                Output.Append;
                Output['Id_Department'] := Selections[i].Values[0];
                Output['Name_Short'] := Selections[i].Values[2];
                if VarIsNull(Output['Name_Short']) then
                    Output['Name_Short'] := ' ';
                Output['Name_Full'] := Selections[i].Values[3];
                Output['Department_Code'] := Selections[i].Values[7];
                Output.Post;
            end;
    end;
    ModalResult := mrOk;
end;

procedure TfmDepartmentsView.ActionControlBeforePrepare(Sender: TObject;
    Form: TForm);
begin
    ActionControl.AddKeys := IntToStr(ActionControl.SelectDataSet['Id_Department']);
    if Form is TfmDepartmentAdd then
        (Form as TfmDepartmentAdd).DM := DataModule;
end;

procedure TfmDepartmentsView.ExitActionExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmDepartmentsView.PrintButtonClick(Sender: TObject);
begin
    DataModule.DepartmentsReport.LoadFromFile('Reports\ASUP\Asup_Departments_Report.fr3');
    if Dsgn then
    begin
        DataModule.DepartmentsReport.DesignReport;
        Dsgn := False;
    end
    else
        DataModule.DepartmentsReport.ShowReport;
end;


procedure TfmDepartmentsView.BitBtn1Click(Sender: TObject);
var
    res: Integer;
begin
    res := fibCheckPermission('/ROOT/SP_DEPARTMENT', 'Del');
    if res <> 0 then
    begin
        qFErrorDialog(AcMgmtErrMsg(res));
        Exit;
    end;

    with DataModule do
        if not DepPropDS.IsEmpty and not SelectDepartments.IsEmpty then
        begin
            DeleteProp.Transaction.StartTransaction;
            DeleteProp.ParamByName('Id_Department').AsInteger :=
                SelectDepartments['Id_Department'];
            DeleteProp.ParamByName('Id_Property').AsInteger := DepPropDs['Id_Property'];
            DeleteProp.ParamByName('Date_Beg').AsDate := DepPropDs['Date_Beg'];
            DeleteProp.ExecQuery;
            DeleteProp.Transaction.Commit;
            DepPropDS.Close;
            DepPropDS.Open;
        end;
end;

procedure TfmDepartmentsView.AddPropActionExecute(Sender: TObject);
var
    form: TfmAddDepProp;
    res: Integer;
begin
    res := fibCheckPermission('/ROOT/SP_DEPARTMENT', 'Edit');
    if res <> 0 then
    begin
        qFErrorDialog(AcMgmtErrMsg(res));
        Exit;
    end;

    form := TfmAddDepProp.Create(Self);
    form.DM := DataModule;
    form.FormControl.Prepare(DataModule.Database, fmAdd, Null,
        DataModule.SelectDepartments['Id_Department']);
    if form.ShowModal = mrOk then
    begin
        if not DataModule.SpDepProp.Active then DataModule.SpDepProp.Open;
        DataModule.DepPropDS.Close;
        DataModule.DepPropDS.Open;
    end;
    form.Free;
end;

procedure TfmDepartmentsView.ActionControlCanEdit(Sender: TObject;
    Mode: TFormMode; var CanPrepare: Boolean);
var
    res: Integer;
begin
    res := fibCheckPermission('/ROOT/SP_DEPARTMENT', 'Edit');
    if res <> 0 then
    begin
        qFErrorDialog(AcMgmtErrMsg(res));
        CanPrepare := False;
    end
    else CanPrepare := True;
end;

procedure TfmDepartmentsView.ActionControlCanDelete(Sender: TObject;
    Mode: TFormMode; var CanPrepare: Boolean);
var
    res: Integer;
begin
    res := fibCheckPermission('/ROOT/SP_DEPARTMENT', 'Del');
    if res <> 0 then
    begin
        qFErrorDialog(AcMgmtErrMsg(res));
        CanPrepare := False;
    end
    else
        if DataModule.SelectDepartments['Id_Department'] =
            DataModule.SelectDepartments.ParamByName('Root').AsInteger then
            CanPrepare := False
        else CanPrepare := True;
end;

procedure TfmDepartmentsView.Id_PropertyOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
begin
    if qSelect(DataModule.SpDepProp) then
    begin
        Value := DataModule.SpDepProp['Id_Property'];
        DisplayText := DataModule.SpDepProp['Name_Property'];
    end;
end;

procedure TfmDepartmentsView.Id_PropertyChange(Sender: TObject);
begin
    ReOpen;
end;

procedure TfmDepartmentsView.PrintButtonMouseUp(Sender: TObject;
    Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    if (ssCtrl in Shift) and (ssShift in Shift) and (ssAlt in Shift) then
        Dsgn := True;
end;

procedure TfmDepartmentsView.UpButtonClick(Sender: TObject);
begin
    if DataModule.SelectDepartments.IsEmpty then Exit;

    with DataModule do
    begin
        MoveQuery.Transaction.StartTransaction;
        MoveQuery.ParamByName('Id_Department').AsInteger :=
            SelectDepartments['Id_Department'];
        if Sender = UpButton then
            MoveQuery.ParamByName('Direction').AsInteger := -1
        else MoveQuery.ParamByName('Direction').AsInteger := +1;
        MoveQuery.ParamByName('Kind').AsInteger := 1;
        MoveQuery.ExecQuery;
        MoveQuery.Transaction.Commit;
        RefreshButton.Click;
    end;
end;

procedure TfmDepartmentsView.FormCreate(Sender: TObject);
begin
    ActDate.Value := DataModule.InputActDate;
    Reopen;
end;

procedure TfmDepartmentsView.Reopen;
begin
    DataModule.SelectDepartments.Close;
    if not VarIsNull(Id_Property.Value) then
        DataModule.SelectDepartments.ParamByName('Id_Prop').AsInteger :=
            Id_Property.Value
    else DataModule.SelectDepartments.ParamByName('Id_Prop').AsInteger := -1;
    DataModule.SelectDepartments.ParamByName('Actual_Date').AsDate := ActDate.Value;
    if ShowDeleted.Value then
        DataModule.SelectDepartments.ParamByName('Show_Deleted').AsInteger := 1
    else DataModule.SelectDepartments.ParamByName('Show_Deleted').AsInteger := 0;

    ActionControl.StdRefresh;

    if DepartmentsTree.TreeList.TopVisibleNode <> nil then
        DepartmentsTree.TreeList.TopVisibleNode.Expand(False);
end;

procedure TfmDepartmentsView.ActionControlRefresh(Sender: TObject);
begin
    ReOpen;
end;

procedure TfmDepartmentsView.DepartmentsTreeTreeListCustomDrawCell(
    Sender: TObject; ACanvas: TcxCanvas;
    AViewInfo: TcxTreeListEditCellViewInfo; var ADone: Boolean);
begin
    if AViewInfo.Selected then
    begin
        ACanvas.Brush.Color := clBlue;
        ACanvas.Font.Color := clWhite
    end
    else
        if AViewInfo.Node.Values[DepartmentsTree.TreeListIsDELETED.ItemIndex] = 1 then
            ACanvas.Brush.Color := $8080FF
        else ACanvas.Brush.Color := DepartmentsTree.TreeList.Styles.Content.Color;
end;

procedure TfmDepartmentsView.ShowDeletedChange(Sender: TObject);
begin
    Reopen;
    if ShowDeleted.Value then
        RestoreButton.Visible := ivAlways
    else RestoreButton.Visible := ivNever;
end;

procedure TfmDepartmentsView.RestoreButtonClick(Sender: TObject);
var
    res: Integer;
begin
    if DataModule.SelectDepartments.IsEmpty then Exit;

    res := fibCheckPermission('/ROOT/SP_DEPARTMENT', 'Edit');
    if res <> 0 then
    begin
        qFErrorDialog(AcMgmtErrMsg(res));
        Exit;
    end;

    if qFConfirm('Ви справді бажаєте відновити підрозділ "' + DataModule.SelectDepartments['Name_Full'] + '"?')
        then
        with DataModule do
        begin
            RestoreQuery.Transaction.StartTransaction;
            RestoreQuery.ParamByName('Id_Department').AsInteger := DataModule.SelectDepartments['Id_Department'];
            RestoreQuery.ExecQuery;
            RestoreQuery.Transaction.Commit;
            Reopen;
        end;
end;

procedure TfmDepartmentsView.MoveButtonClick(Sender: TObject);
var
    sp: TSprav;
    id_Department: Integer;
begin
    sp := GetSprav('SpDepartment');
    if sp <> nil then
    begin
        // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(DataModule.Database.Handle);
            FieldValues['Actual_Date'] := Date();
            FieldValues['AllowEdit'] := False;
            Post;
        end;
        // показать справочник и проанализировать результат (выбор одного подр.)
        sp.Show;
        if (sp.Output <> nil) and not sp.Output.IsEmpty then
        begin
            with DataModule.TeleportDepartment do
            begin
                Transaction.StartTransaction;
                ParamByName('Id_Department').AsInteger := DataModule.SelectDepartments['Id_Department'];
                ParamByName('Where_Department').AsInteger := sp.Output['Id_Department'];
                ExecQuery;
                Transaction.Commit;

                Id_Department := DataModule.SelectDepartments['Id_Department'];
                DataModule.SelectDepartments.Close;
                DataModule.SelectDepartments.Open;
                DataModule.SelectDepartments.Locate('Id_Department', Id_Department, []);
            end;
        end;
        sp.Free;
    end;
end;

procedure TfmDepartmentsView.RefreshActionExecute(Sender: TObject);
var
    id_Department: Integer;
begin
    Id_Department := DataModule.SelectDepartments['Id_Department'];
    DataModule.SelectDepartments.Close;
    DataModule.SelectDepartments.Open;
    DataModule.SelectDepartments.Locate('Id_Department', Id_Department, []);
end;

procedure TfmDepartmentsView.dxRestoreButtonClick(Sender: TObject);
var
    res: Integer;
begin
    if DataModule.SelectDepartments.IsEmpty then Exit;

    res := fibCheckPermission('/ROOT/SP_DEPARTMENT', 'Edit');
    if res <> 0 then
    begin
        qFErrorDialog(AcMgmtErrMsg(res));
        Exit;
    end;

    if qFConfirm('Ви справді бажаєте відновити підрозділ "' + DataModule.SelectDepartments['Name_Full'] + '"?')
        then
        with DataModule do
        begin
            RestoreQuery.Transaction.StartTransaction;
            RestoreQuery.ParamByName('Id_Department').AsInteger := DataModule.SelectDepartments['Id_Department'];
            RestoreQuery.ExecQuery;
            RestoreQuery.Transaction.Commit;
            Reopen;
        end;
end;

procedure TfmDepartmentsView.dxMoveButtonClick(Sender: TObject);
var
    sp: TSprav;
    id_Department: Integer;
begin
    sp := GetSprav('SpDepartment');
    if sp <> nil then
    begin
        // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(DataModule.Database.Handle);
            FieldValues['Actual_Date'] := Date();
            FieldValues['AllowEdit'] := False;
            Post;
        end;
        // показать справочник и проанализировать результат (выбор одного подр.)
        sp.Show;
        if (sp.Output <> nil) and not sp.Output.IsEmpty then
        begin
            with DataModule.TeleportDepartment do
            begin
                Transaction.StartTransaction;
                ParamByName('Id_Department').AsInteger := DataModule.SelectDepartments['Id_Department'];
                ParamByName('Where_Department').AsInteger := sp.Output['Id_Department'];
                ExecQuery;
                Transaction.Commit;

                Id_Department := DataModule.SelectDepartments['Id_Department'];
                DataModule.SelectDepartments.Close;
                DataModule.SelectDepartments.Open;
                DataModule.SelectDepartments.Locate('Id_Department', Id_Department, []);
            end;
        end;
        sp.Free;
    end;
end;

procedure TfmDepartmentsView.dxUpButtonClick(Sender: TObject);
begin
    if DataModule.SelectDepartments.IsEmpty then Exit;

    with DataModule do
    begin
        MoveQuery.Transaction.StartTransaction;
        MoveQuery.ParamByName('Id_Department').AsInteger :=
            SelectDepartments['Id_Department'];
        if Sender = UpButton then
            MoveQuery.ParamByName('Direction').AsInteger := -1
        else MoveQuery.ParamByName('Direction').AsInteger := +1;
        MoveQuery.ParamByName('Kind').AsInteger := 1;
        MoveQuery.ExecQuery;
        MoveQuery.Transaction.Commit;
        RefreshButton.Click;
    end;
end;

procedure TfmDepartmentsView.DownButtonClick(Sender: TObject);
begin
    if DataModule.SelectDepartments.IsEmpty then Exit;

    with DataModule do
    begin
        MoveQuery.Transaction.StartTransaction;
        MoveQuery.ParamByName('Id_Department').AsInteger :=
            SelectDepartments['Id_Department'];
        if Sender = UpButton then
            MoveQuery.ParamByName('Direction').AsInteger := -1
        else MoveQuery.ParamByName('Direction').AsInteger := +1;
        MoveQuery.ParamByName('Kind').AsInteger := 1;
        MoveQuery.ExecQuery;
        MoveQuery.Transaction.Commit;
        RefreshButton.Click;
    end;
end;

procedure TfmDepartmentsView.dxPrintButtonClick(Sender: TObject);
begin
    DataModule.DepartmentsReport.LoadFromFile('Reports\ASUP\Asup_Departments_Report.fr3');
    if Dsgn then
    begin
        DataModule.DepartmentsReport.DesignReport;
        Dsgn := False;
    end
    else
        DataModule.DepartmentsReport.ShowReport;
end;

procedure TfmDepartmentsView.dxBarLargeButton2Click(Sender: TObject);
var
    frm: TfrmPrintReport;
    title: variant;
    vardate: variant;
    str,str1: string;
    i: Integer;
    Index: Integer;
    Variable: TfrxVariable;
begin
    frm := TfrmPrintReport.Create(Self);
    frm.cxDateEdit.Date:=Date();
    if frm.ShowModal = mrOk then
    begin
        DataModule.PrintProp.Active := False;

        DataModule.PrintProp.SelectSQL.Text := 'select * from SP_DEPARTMENT_PRINT(:in_date, :in_id_dep) d';

        try
            DataModule.PrintProp.ParamByName('in_date').Value := frm.cxDateEdit.Date;
            if (frm.cxButtonEdit.Text<>'') and (frm.id_property<>-1) then
                DataModule.PrintProp.ParamByName('in_id_dep').AsInt64 := frm.Id_Property;

            DataModule.PrintProp.Open;
        except
            on E: Exception do
            begin
                messageBox(0, PChar('Помилка при підготовці звіту!'), 'Помилка!', MB_OK);
                frm.Free;
                Exit;
            end;
        end;
        //DataModule.DepartmentsDS.DataSet:=DataModule.PrintProp;
        vardate:=DateToStr(frm.cxDateEdit.Date);
        str:=DepartmentsTree.TreeListDISPLAY_NAME.Values[0];
        for i:=1 to Length(str) do
        begin
            str1:=str1+str[i];
            if str[i]='''' then str1:=str1+'''';
        end;
        title:=str1;
    //    if frm.cxCheckBox1.Checked then
    //         DataModule.DepartmentsReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\DepartmentsID.fr3')
        DataModule.DepartmentsReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Departments.fr3');
        DataModule.DepartmentsReport.Variables.Clear;

        DataModule.DepartmentsReport.Variables['DEP_DATE']  := ''''+ vardate + '''';
        DataModule.DepartmentsReport.Variables['TITLE']     := ''''+ title+'''';
        DataModule.DepartmentsReport.Variables['PRINT_ID']  := frm.cxCheckBox1.EditValue;
        if frm.dsgn then
        begin
            DataModule.DepartmentsReport.DesignReport;
        end else begin       
            DataModule.DepartmentsReport.ShowReport;
        end;
    end;
    frm.Free;
end;

end.

