unit uMassMoveOrder;

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
  uSimpleCheck, qFTools, fmMassMoveOrderUnit, uShtatUtils;

    type
    TMassMoveOrder = class(TSprav)
    private
        IsConnected: Boolean;
        Form: TfmMassMoveOrder;
    public
        constructor Create;
        destructor  Destroy;override;
        procedure   Show;override;
    end;

    function CreateSprav: TSprav;stdcall;
    exports CreateSprav;

implementation

function CreateSprav: TSprav;
begin
    Result := TMassMoveOrder.Create;
end;

constructor TMassMoveOrder.Create;
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
    Input.FieldDefs.Add('Num_Order', ftString, 10);
    Input.FieldDefs.Add('Note_Order', ftString, 255);

    Output.FieldDefs.Add('New_Id_Order', ftInteger);
end;

destructor TMassMoveOrder.Destroy;
begin
    inherited Destroy;
end;

procedure TMassMoveOrder.Show;
var
    hnd : Integer;
    Mode : TFormMode;
begin
    Form := TfmMassMoveOrder.Create(Application.MainForm);

    Form.LocalReadTransaction.Active := False;
    Form.LocalWriteTransaction.Active := False;

    if Form.LocalDatabase.Connected then Form.LocalDatabase.Close;

    hnd := Input['DBHANDLE'];
    Form.LocalDatabase.Handle := TISC_DB_HANDLE(hnd);

    case Input['SpMode'] of
        1 : Mode := fmAdd;
        2 : Mode := fmModify;
        3 : Mode := fmInfo;
    end;

    fmMassMoveOrder := Form;

    Form.IDOrder := Input['Id_Order'];
    Form.DateOrder := Input['Date_Order'];

    if Mode = fmAdd then begin
        Form.DateBeg.Value := Date;

        try
            Form.LocalWriteTransaction.StartTransaction;
            Form.InsertOrderQuery.Close;
            Form.InsertOrderQuery.SelectSQL.Text := 'SELECT NEW_ID_ORDER FROM INSERT_ORDER(0,' +
                                                    IntToStr(Input['Id_Order_Type']) + ',' +
                                                    QuotedStr(Input['Num_Order']) + ',''' +
                                                    DateToStr(Input['Date_Order']) +''',' +
                                                    QuotedStr(Input['Note_Order']) + ',' +
                                                    IntToStr(1) + ');';
            Form.InsertOrderQuery.Open;
            Form.IdOrder := Form.InsertOrderQuery['NEW_ID_ORDER'];

        except on e:exception do begin
                Form.LocalWriteTransaction.Rollback;
                Form.Free;
                MessageDlg('При занесенні данних у базу виникла помилка: "' + E.Message + '"', mtError, [mbOk], 0);
                exit;
            end;
        end;

        Form.LocalWriteTransaction.Commit;
    end;

    Form.ResultQuery.Close;
    Form.ResultQuery.ParamByName('id_order').AsInteger := Form.IdOrder;
    Form.ResultQuery.Open;

    if not Form.ResultQuery.IsEmpty then begin
        Form.DateBeg.Value := Form.ResultQueryDATE_BEG.Value;
        Form.Department.Value := Form.ResultQueryID_DEPARTMENT.Value;
        Form.Department2.Value := Form.ResultQueryID_DEPARTMENT2.Value;
        Form.Department.DisplayText := Form.ResultQueryDEPARTMENT_NAME.Value;
        Form.Department2.DisplayText := Form.ResultQueryDEPARTMENT_NAME2.Value;
        Form.Reason.Value := Form.ResultQueryREASON.Value;
    end;

    Form.ShowModal;

    if Form.IdOrder <> -1 then begin
        Output.Open;
        Output.Append;
        Output['New_Id_Order'] := Form.IdOrder;
        Output.Post;
    end;

    Form.Free;
end;

end.
