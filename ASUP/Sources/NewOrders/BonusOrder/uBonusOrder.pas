unit uBonusOrder;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, DB, RxMemDS, uCommonSp, uFormControl, Buttons, Grids, Spin,
    StdCtrls, SpComboBox, DBGrids, ExtCtrls, Mask, CheckEditUnit, ComCtrls,
    uFControl, uLabeledFControl, uSpravControl, uDateControl, uEnumControl,
    uCharControl, uIntControl, uBoolControl, FIBDatabase, pFIBDatabase,
    FIBDataSet, pFIBDataSet, ibase, uSelectForm, uFloatControl,
    ActnList, cxStyles, cxCustomData, cxGraphics, cxFilter,
    cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel,
    cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
    cxControls, cxGridCustomView, cxGrid, uActionControl, uLogicCheck,
    uSimpleCheck, qFTools, fmBonusOrderUnit, uShtatUtils;

type
    TBonusOrder = class(TSprav)
    private
        IsConnected: Boolean;
        Form: TfmBonusOrder;
    public
        constructor Create;
        destructor Destroy; override;
        procedure Show; override;
    end;

function CreateSprav: TSprav; stdcall;
exports CreateSprav;

implementation

function CreateSprav: TSprav;
begin
    Result := TBonusOrder.Create;
end;

constructor TBonusOrder.Create;
begin
    inherited Create;

    // создание входных/выходных полей
    Input.FieldDefs.Add('Id_Order_Type', ftInteger);
    Input.FieldDefs.Add('Id_Order', ftInteger);
    Input.FieldDefs.Add('Date_Order', ftDate);
    Input.FieldDefs.Add('SpMode', ftInteger);
    Input.FieldDefs.Add('Num_Item', ftInteger);
    Input.FieldDefs.Add('Sub_Item', ftInteger);
    Input.FieldDefs.Add('Id_Order_Group', ftInteger);
    Input.FieldDefs.Add('Intro', ftString, 4096);
    Input.FieldDefs.Add('Id_Man_Bonus', ftInteger);
    Input.FieldDefs.Add('Id_Man_Moving', ftInteger);
    Input.FieldDefs.Add('SpType', ftInteger); // “ип справочника (если 1, то редактирование и добавление идет по ID_MAN_MOVING, иначе - по ID_ORDER)
    Input.FieldDefs.Add('Date_Beg', ftDate);
    Input.FieldDefs.Add('Date_End', ftDate);

    Output.FieldDefs.Add('New_Id_Order', ftInteger);
    Output.FieldDefs.Add('New_Id_Man_Bonus', ftInteger);
end;

destructor TBonusOrder.Destroy;
begin
    inherited Destroy;
end;

procedure TBonusOrder.Show;
var
    hnd: Integer;
    Mode: TFormMode;
begin
    Form := TfmBonusOrder.Create(Application.MainForm);

    Form.LocalReadTransaction.Active := False;
    Form.LocalWriteTransaction.Active := False;

    if Form.LocalDatabase.Connected then Form.LocalDatabase.Close;

    hnd := Input['DBHANDLE'];
    Form.LocalDatabase.Handle := TISC_DB_HANDLE(hnd);

    case Input['SpMode'] of
        1: Mode := fmAdd;
        2: Mode := fmModify;
        3: Mode := fmInfo;
    end;
    Form.Id_order_group:=Input['ID_ORDER_GROUP'];

    Form.dmShtatUtils := TdmShtatUtils.Create(Form, Integer(Form.LocalDatabase.Handle), Input['Date_Order']);

    fmBonusOrder := Form;

    Form.IDOrder := Input['Id_Order'];
    Form.DateOrder := Input['Date_Order'];
    Form.SpType := Input['SpType'];

    if Mode = fmInfo then begin
        Form.RecalcSmetsButton.Enabled := False;
        Form.IsPercentBox.Enabled := False;
    end;

    if Input['SpType'] = 0 then begin

        Form.FormControl.Prepare(Form.LocalDatabase, Mode, Input['Id_Order'], 0);

        if not VarIsNull(Input['ID_ORDER_TYPE']) then
            Form.FormControl.InsertSQL.Text := StringReplace(Form.FormControl.InsertSQL.Text, ':ID_ORDER_TYPE', IntToStr(Input['ID_ORDER_TYPE']), []);

        if not VarIsNull(Input['NUM_ITEM']) then
            Form.FormControl.InsertSQL.Text := StringReplace(Form.FormControl.InsertSQL.Text, ':NUM_ITEM', IntToStr(Input['NUM_ITEM']), []);

        if not VarIsNull(Input['SUB_ITEM']) then
            Form.FormControl.InsertSQL.Text := StringReplace(Form.FormControl.InsertSQL.Text, ':SUB_ITEM', IntToStr(Input['SUB_ITEM']), []);

        if not VarIsNull(Input['ID_ORDER_GROUP']) then
            Form.FormControl.InsertSQL.Text := StringReplace(Form.FormControl.InsertSQL.Text, ':ID_ORDER_GROUP', IntToStr(Input['ID_ORDER_GROUP']), []);

        if not VarIsNull(Input['INTRO']) then
            Form.FormControl.InsertSQL.Text := StringReplace(Form.FormControl.InsertSQL.Text, ':INTRO', QuotedStr(Input['INTRO']), []);
    end;

    if Input['SpType'] = 1 then begin
        Form.FormControl.InsertSQL.Text := 'Select * from ASUP_DT_MAN_BONUS_INSERT2 (' +
                                           IntToStr(Input['Id_Man_Moving']) + ',' +
                                           ':IS_PERCENT,' +
                                           ':PERCENT,' +
                                           ':SUMMA,' +
                                           ':DATE_BEG,' +
                                           ':DATE_END,' +
                                           ':ID_RAISE,' +
                                           ':NOTE,' +
                                           ':REASON,' +
                                           IntToStr(Input['ID_ORDER']) + ',' +
                                           ':sovm_id_department,' +
                                           ':Sovm_Id_Post_Salary' + ')';

        Form.FormControl.SelectSQL.Text := 'SELECT * FROM ASUP_DT_MAN_BONUS_SELECT2(:where)';

        Form.FormControl.UpdateSQL.Text := 'EXECUTE PROCEDURE ASUP_DT_MAN_BONUS_UPDATE2 (' + 
                                           IntToStr(Input['ID_MAN_MOVING']) + ',' +
                                           ':IS_PERCENT,' +
                                           ':PERCENT,' +
                                           ':SUMMA,' +
                                           ':DATE_BEG,' +
                                           ':DATE_END,' +
                                           ':ID_RAISE,' +
                                           ':NOTE,' +
                                           ':REASON,' +
                                           ':where'  + ',' +
                                           ':sovm_id_department,' +
                                           ':Sovm_Id_Post_Salary' + ')';;

        Form.WorkPlace.Required := False;
        Form.WorkPlace.Visible := False;
        Form.Fio.Required := False;
        Form.Fio.Visible := False;

        Form.IdManBonus := Input['Id_Man_Bonus'];
        Form.FormControl.Prepare(Form.LocalDatabase, Mode, Input['Id_Man_Bonus'], 0);

        Form.WorkPlace.Value := Input['ID_MAN_MOVING'];
        Form.FIO.Value := -1; // «аглушка
        Form.DateBeg.Value := Input['Date_Beg'];
        Form.DateEnd.Value := Input['Date_End'];        
    end;

    Form.ShowModal;

    if (Form.IdOrder <> -1) and (Input['SpType'] = 0)
        then begin
        Output.Open;
        Output.Append;
        Output['New_Id_Order'] := Form.IdOrder;
        Output.Post;
    end;

    if (Form.IdManBonus <> -1) and (Input['SpType'] = 1)
        then begin
        Output.Open;
        Output.Append;
        Output['New_Id_Man_Bonus'] := Form.IdManBonus;
        Output.Post;
    end;

    Form.Free;
end;

end.

