unit UP_HP_RecalcAll;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, uFControl, uLabeledFControl, uEnumControl, StdCtrls, Buttons,
    ExtCtrls, UP_HP_DM, DB, FIBDataSet, pFIBDataSet, ActnList;

type
    THP_RecalcForm = class(TForm)
        BottomPanel: TPanel;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        qFEC_Interval: TqFEnumControl;
        qFEC_Level: TqFEnumControl;
        pFIBDS_FillPeriod: TpFIBDataSet;
        pFIBDS_FillLevel: TpFIBDataSet;
        ActionList1: TActionList;
        SecretAction: TAction;
        OK: TAction;
        ESC: TAction;
        constructor Create(aOwner: TComponent; DM: THP_Dm); reintroduce;
        procedure FormShow(Sender: TObject);
        procedure OKExecute(Sender: TObject);
        procedure ESCExecute(Sender: TObject);
    private
        DModule: THP_Dm;
        def_level, def_year: int64;
        { Private declarations }
    public
        key_session: Int64;
        { Public declarations }
    end;

implementation

{$R *.dfm}

constructor THP_RecalcForm.Create(aOwner: TComponent; DM: THP_Dm);
var
    VString: string;
begin
    inherited Create(aOwner);

    DModule := DM;

    with DModule do
    begin
        pFIBT_Write.StartTransaction;
        pFIBDS_GetIdSession.Open;
        key_session := pFIBDS_GetIdSession['id_session'];
        pFIBDS_GetIdSession.Close;
        pFIBT_Write.Commit;
    end;

    pFIBDS_FillPeriod.Database := DModule.pFIBD_HP;
    pFIBDS_FillPeriod.Transaction := DModule.pFIBT_Read;
    pFIBDS_FillPeriod.Open;
    pFIBDS_FillPeriod.First;

    VString := '';

    qFEC_Interval.ValuesString := IntToStr(pFIBDS_FillPeriod['ACT_PERIOD']);
    qFEC_Interval.Items.Add(IntToStr(pFIBDS_FillPeriod['ACT_PERIOD']));

    def_year := pFIBDS_FillPeriod['ACT_PERIOD'];

    pFIBDS_FillPeriod.Close;
    ;

    pFIBDS_FillLevel.Database := DModule.pFIBD_HP;
    pFIBDS_FillLevel.Transaction := DModule.pFIBT_Read;
    pFIBDS_FillLevel.Open;
    pFIBDS_FillLevel.First;

    while not pFIBDS_FillLevel.Eof do
    begin
        qFEC_Level.Items.Add(pFIBDS_FillLevel['level_name']);
        VString := VString + IntToStr(pFIBDS_FillLevel['id_level']);

        pFIBDS_FillLevel.Next;
        if (not pFIBDS_FillLevel.Eof) then
            VString := VString + ',';
    end;

    qFEC_Level.ValuesString := VString;

    def_level := pFIBDS_FillLevel['id_def'];

    pFIBDS_FillLevel.Close;
end;

procedure THP_RecalcForm.FormShow(Sender: TObject);
begin
    qFEC_Level.Value := def_level;
    qFEC_Interval.Value := def_year;
end;

procedure THP_RecalcForm.OKExecute(Sender: TObject);
begin
    ModalResult := mrOk;
end;

procedure THP_RecalcForm.ESCExecute(Sender: TObject);
begin
    Close;
end;

end.
