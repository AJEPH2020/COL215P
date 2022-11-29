-- Name: Atul Jeph
-- Entry No: 2020CS10329
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE ieee.NUMERIC_STD.ALL;
ENTITY main IS
    PORT (
        A, B : IN UNSIGNED(31 DOWNTO 0);
        ALU_Select : IN UNSIGNED(3 DOWNTO 0);
        ALU_Output : OUT UNSIGNED(31 DOWNTO 0);
        cin : IN STD_LOGIC;
        cout : OUT STD_LOGIC
    );
END main;
ARCHITECTURE Behavioral OF main IS

    SIGNAL ALU_Bit : UNSIGNED (31 DOWNTO 0);
    SIGNAL temprary : UNSIGNED (32 DOWNTO 0);
    SIGNAL c : STD_LOGIC;

BEGIN
    PROCESS (A, B, ALU_Select, cin)
    BEGIN
        CASE(ALU_Select) IS
            WHEN "0000" =>
            ALU_Bit <= A AND B;
            c <= cin;

            WHEN "0001" =>
            ALU_Bit <= A XOR B;
            c <= cin;

            WHEN "0010" =>
            ALU_Bit <= A + NOT(B) + "1";
            c <= cin;

            WHEN "0011" =>
            ALU_Bit <= NOT(A) + B + "1";
            c <= cin;

            WHEN "0100" =>
            ALU_Bit <= A + B;
            temprary <= ('0' & A) + ('0' & B);
            c <= temprary(32);

            WHEN "0101" =>
            IF (cin = '1') THEN
                ALU_Bit <= A + B + "1";
                temprary <= ('0' & A) + ('0' & B) + "1";
                c <= temprary(32);
            ELSE
                ALU_Bit <= A + B;
                temprary <= ('0' & A) + ('0' & B);
                c <= temprary(32);
            END IF;

            WHEN "0110" =>
            IF (cin = '1') THEN
                ALU_Bit <= A + NOT(B) + "1";
                temprary <= ('0' & A) + ('0' & NOT(B)) + "1";
                c <= temprary(32);
            ELSE
                ALU_Bit <= A + NOT(B);
                temprary <= ('0' & A) + ('0' & NOT(B));
                c <= temprary(32);
            END IF;

            WHEN "0111" =>
            IF (cin = '1') THEN
                ALU_Bit <= NOT(A) + B + "1";
                temprary <= ('0' & NOT(A)) + ('0' & B) + "1";
                c <= temprary(32);
            ELSE
                ALU_Bit <= NOT(A) + B;
                temprary <= ('0' & NOT(A)) + ('0' & B);
                c <= temprary(32);

            END IF;

            WHEN "1000" =>
            ALU_Bit <= A AND B;
            c <= cin;

            WHEN "1001" =>
            ALU_Bit <= A XOR B;
            c <= cin;

            WHEN "1010" =>
            ALU_Bit <= A + NOT(B) + "1";
            c <= cin;

            WHEN "1011" =>
            ALU_Bit <= A + B;
            temprary <= ('0' & A) + ('0' & B);
            c <= temprary(32);

            WHEN "1100" =>
            ALU_Bit <= A OR B;
            c <= cin;

            WHEN "1101" =>
            ALU_Bit <= B;
            c <= cin;

            WHEN "1110" =>
            ALU_Bit <= A AND NOT(B);
            c <= cin;

            WHEN "1111" =>
            ALU_Bit <= NOT(B);
            c <= cin;

            WHEN OTHERS => NULL;

        END CASE;
    END PROCESS;

    ALU_Output <= ALU_Bit;
    cout <= c;

END Behavioral;