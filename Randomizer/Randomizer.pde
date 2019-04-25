float fA, fB, fC;
color fondo, nFondo;
int t, ctrl;

    int dA, dB;
    String[][] distancia = { // Equivalencias en metros
        {"Brazo (Izada de Bandera)",    "0.6"},
        {"Baston de Mando",             "1.2"},
        {"Pie",                         "0.33"},
        {"Globo",                       "1.3"},
        {"Codo",                        "0.5"},
        {"Dedo",                        "0.015"},
        {"Brazo",                       "0.2"},
        {"Lapiz de Dibujo",             "0.185"},
        {"Yeyo",                        "1.5"},
        {"Yeyo Extendido",              "1.9"},
    };

    int tA, tB;
    String[][] tiempo = { // Equivalencias en minutos
        {"Botella de Poker",    "15"},
        {"Giro de Almohada",    "20"},
        {"Ratico",              "5"},
        {"Rato",                "10"},
        {"Bus del SITP",        "7"},
        {"Ciclo Lunar",         "45523"},
        {"Fase Lunar",          "5000"},
        {"Cancion",             "3.5"},
        {"Semaforo",            "0.45"},
        {"Punto en Basquet",    "0.26"},
    };

    int cA, cB;
    String[][] cantidad = { // Equivalencias en Puchos
        {"Pucho",                 "1"},
        {"Puchito",             "0.5"},
        {"Puchote",             "1.5"},
        {"Puñado",              "0.8"},
        {"Resto",               "100"},
        {"Botella",             "2.5"},
        {"Bulto",               "2000"},
        {"Carga",               "4000"},
        {"Pocillo de Arroz",    "1.2"},
        {"Agua para Pollo",     "4.7"},
    };

void setup(){
    // Parámetros Iniciales
        fullScreen();
        colorMode(RGB);
        noStroke();
        textSize(height/10);
        textAlign(CENTER, CENTER);
        ctrl = 0;
    // Preejecución
        update();
        //noLoop(); // Descomentar para usar en PC
}

void draw() {
    background(fondo);
    fill(t);
    // Impresión de Texto
        pushStyle();
        switch (ctrl) {
            case 0: // Distancia
                text("1 " + distancia[dA][0], width/2, height/3);
                text("equivale a", width/2, height/2);
                text(equivalencia(distancia[dA][1],distancia[dB][1]) + " " + distancia[dB][0], width/2, 2*height/3);
                pushStyle();
                    textAlign(LEFT,TOP);
                    textSize(height/20);
                    text("Distancia", height/40, height/40);
                popStyle();
            break;
            case 1: // Tiempo
                text("1 " + tiempo[tA][0], width/2, height/3);
                text("equivale a", width/2, height/2);
                text(equivalencia(tiempo[tA][1],tiempo[dB][1]) + " " + tiempo[dB][0], width/2, 2*height/3);
                pushStyle();
                    textAlign(LEFT,TOP);
                    textSize(height/20);
                    text("Tiempo", height/40, height/40);
                popStyle();
            break;
            case 2: // Cantidad
                text("1 " + cantidad[cA][0], width/2, height/3);
                text("equivale a", width/2, height/2);
                text(equivalencia(cantidad[cA][1],cantidad[dB][1]) + " " + cantidad[dB][0], width/2, 2*height/3);
                pushStyle();
                    textAlign(LEFT,TOP);
                    textSize(height/20);
                    text("Cantidad", height/40, height/40);
                popStyle();
            break;
        }
        popStyle();
}

void update() {
    // Colores Aleatorios para el Fondo
        fA = random(255);
        fB = random(255);
        fC = random(255);
    // Fondo y su Negativo
        fondo = color(fA, fB, fC);
        nFondo = color(neg(fA), neg(fB), neg(fC));
    // Color del Texto
        if (fA + fB + fC < 380)
            t = 255;
        else
            t = 0;
    // Selector de Medida (Distancia)
        dA = (int) random(distancia[0].length);
        dB = (int) random(distancia[0].length);
        while (dA == dB) {
            dA = int( random(distancia[0].length + 1) );
            dB = int( random(distancia[0].length + 1) );
        }
    // Selector de Medida (Tiempo)
        tA = (int) random(tiempo[0].length);
        tB = (int) random(tiempo[0].length);
        while (tA == tB) {
            tA = int( random(tiempo[0].length + 1) );
            tB = int( random(tiempo[0].length + 1) );
        }
    // Selector de Medida (Cantidad)
        cA = (int) random(cantidad[0].length);
        cB = (int) random(cantidad[0].length);
        while (cA == cB) {
            cA = int( random(cantidad[0].length + 1) );
            cB = int( random(cantidad[0].length + 1) );
        }
    // Control Global
        ctrl++;
        ctrl %= 3;
}

public float neg (float x) {
    x = 255 - x;
    return x;
}

public String equivalencia (String a, String b) {
    float x = parseFloat(a);
    float y = parseFloat(b);
    return nfc(x/y, 2);
}

void mousePressed() {
  update();
  redraw();
}
